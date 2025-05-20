<?php
require_once __DIR__ . '/../db_pdo.php';

function checkCompatibility(array $items): array {
    $pdo   = getPDO();
    $specs = [];
    
    foreach ($items as $it) {
        $cat = $it['category'];
        $id  = (int)$it['id'];
        switch ($cat) {
            case 'CPU':
                $stmt = $pdo->prepare(
                    'SELECT socket, tdp
                    FROM CPU_Spec s
                    JOIN Part p ON s.part_id=p.id
                    WHERE p.id=:id'
                );
                break;
            case 'Motherboard':
                $stmt = $pdo->prepare(
                    'SELECT socket, form_factor, memory_max, ram_slots, m2_slots, sata_ports
                    FROM Motherboard_Spec s
                    JOIN Part p ON s.part_id=p.id
                    WHERE p.id=:id'
                );
                break;
            case 'Memory':
                $stmt = $pdo->prepare(
                    'SELECT modules, capacity, type
                    FROM Memory_Spec s
                    JOIN Part p ON s.part_id=p.id
                    WHERE p.id=:id'
                );
                break;
            case 'CPU Cooler':
                $stmt = $pdo->prepare(
                    'SELECT height
                    FROM Cooler_Spec s
                    JOIN Part p ON s.part_id=p.id
                    WHERE p.id=:id'
                );
                break;
            case 'Case':
                $stmt = $pdo->prepare(
                    'SELECT supported_form_factors, max_cpu_cooler_height,
                            max_gpu_length, hdd_bays, ssd_bays, psu_form_factor
                    FROM Case_Spec s
                    JOIN Part p ON s.part_id=p.id
                    WHERE p.id=:id'
                );
                break;
            case 'GPU':
                $stmt = $pdo->prepare(
                    'SELECT length, tdp
                    FROM GPU_Spec s
                    JOIN Part p ON s.part_id=p.id
                    WHERE p.id=:id'
                );
                break;
            case 'PSU':
                $stmt = $pdo->prepare(
                    'SELECT form_factor, wattage
                    FROM PSU_Spec s
                    JOIN Part p ON s.part_id=p.id
                    WHERE p.id=:id'
                );
                break;
            default:
                continue 2;
        }
        $stmt->execute([':id'=>$id]);
        // 키에는 공백 제거
        $key = str_replace(' ', '', $cat);
        $specs[$key] = $stmt->fetch(PDO::FETCH_ASSOC);
    }

    $issues = [];
    if (isset($specs['CPU'], $specs['Motherboard'])
        && $specs['CPU']['socket'] !== $specs['Motherboard']['socket']) {
        $issues[] = "CPU socket ({$specs['CPU']['socket']}) does not match motherboard socket ({$specs['Motherboard']['socket']}).";
    }
    if (isset($specs['Memory'], $specs['Motherboard'])) {
        $mem = $specs['Memory'];
        $mb  = $specs['Motherboard'];
        if ($mem['modules'] > $mb['ram_slots']) {
            $issues[] = "Number of memory modules ({$mem['modules']}) exceeds motherboard RAM slots ({$mb['ram_slots']}).";
        }
        $totalMem = $mem['modules'] * $mem['capacity'];
        if ($totalMem > $mb['memory_max']) {
            $issues[] = "Total memory capacity ({$totalMem}GB) exceeds motherboard maximum memory ({$mb['memory_max']}GB).";
        }
    }
    if (isset($specs['CPUCooler'], $specs['Case'])
        && $specs['CPUCooler']['height'] > $specs['Case']['max_cpu_cooler_height']) {
        $issues[] = "Cooler height ({$specs['CPUCooler']['height']}mm) exceeds case max CPU cooler height ({$specs['Case']['max_cpu_cooler_height']}mm).";
    }
    if (isset($specs['GPU'], $specs['Case'])
        && $specs['GPU']['length'] > $specs['Case']['max_gpu_length']) {
        $issues[] = "GPU length ({$specs['GPU']['length']}mm) exceeds case max GPU length ({$specs['Case']['max_gpu_length']}mm).";
    }
    if (isset($specs['Motherboard'], $specs['Case'])) {
        $mbForm    = $specs['Motherboard']['form_factor'];
        $supported = explode(',', $specs['Case']['supported_form_factors']);
        if (!in_array($mbForm, $supported)) {
            $issues[] = "Motherboard form factor ({$mbForm}) is not supported by the case.";
        }
    }
    if (isset($specs['PSU'], $specs['Case'])
        && $specs['PSU']['form_factor'] !== $specs['Case']['psu_form_factor']) {
        $issues[] = "PSU form factor ({$specs['PSU']['form_factor']}) does not match case PSU form factor ({$specs['Case']['psu_form_factor']}).";
    }

    return [
        'success' => empty($issues),
        'issues'  => $issues
    ];
}
