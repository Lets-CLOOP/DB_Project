<?php

require_once __DIR__ . '/config.php';

/**
 * @return \PDO
 */
function getDatabaseConnection(): \PDO
{
    return getPDO();
}

$SPEC_TABLE_MAP = [
    'CPU'         => ['table' => 'CPU_Spec',        'cols' => ['socket','cores','core_clock','boost_clock','architecture','tdp','integrated_graphics']],
    'CPU Cooler'  => ['table' => 'Cooler_Spec',     'cols' => ['fan_rpm','noise_level','color','radiator_size', 'height']],
    'Motherboard' => ['table' => 'Motherboard_Spec','cols' => ['socket','form_factor','memory_max','ram_slots','m2_slots','sata_ports','color']],
    'Memory'      => ['table' => 'Memory_Spec',     'cols' => ['speed','modules','capacity','type','color']],
    'Storage'     => ['table' => 'Storage_Spec',    'cols' => ['capacity','type','cache','form_factor','interface','bay_size']],
    'GPU'         => ['table' => 'GPU_Spec',        'cols' => ['chipset','memory','core_clock','boost_clock','length','tdp','power_connectors','interface']],
    'PSU'         => ['table' => 'PSU_Spec',        'cols' => ['wattage','efficiency','modularity','color','form_factor']],
    'Case'        => ['table' => 'Case_Spec',       'cols' => ['type','supported_form_factors','side_panel','hdd_bays','ssd_bays','volume','color','max_gpu_length','max_cpu_cooler_height','psu_form_factor']],
];
