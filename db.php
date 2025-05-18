<?php
$host   = 'localhost';
$db     = 'pc_builder';
$user   = 'root';
$pass   = 'YOUR_PASSWORD';   
$charset= 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
];

try {
    $pdo = new PDO($dsn, $user, $pass, $options);
} catch (PDOException $e) {
    http_response_code(500);
    echo "DB Connection Error: " . $e->getMessage();
    exit;
}

define('SPEC_TABLE_MAP', [
    'CPU'           => ['table'=>'CPU_Spec',        'cols'=>['cores','core_clock','boost_clock','architecture','tdp','integrated_graphics']],
    'CPU Cooler'    => ['table'=>'Cooler_Spec',     'cols'=>['fan_rpm','noise_level','color','radiator_size']],
    'Motherboard'   => ['table'=>'Motherboard_Spec','cols'=>['socket','form_factor','memory_max','memory_slots','color']],
    'Memory'        => ['table'=>'Memory_Spec',     'cols'=>['speed','modules','color']],
    'Storage'       => ['table'=>'Storage_Spec',    'cols'=>['capacity','type','cache','form_factor','interface']],
    'Video Card'    => ['table'=>'GPU_Spec',        'cols'=>['chipset','memory','core_clock','boost_clock','color','length']],
    'Case'          => ['table'=>'Case_Spec',       'cols'=>['type','color','side_panel','volume']],
    'Power Supply'  => ['table'=>'PSU_Spec',        'cols'=>['type','efficiency','wattage','modularity','color']],
]);
