        ],
      ),
    );
  }
  
  Widget _buildBatteryCard() {
    if (_batteryStatus == null) {
      return Card(
        child: ListTile(
          leading: const Icon(Icons.battery_unknown),
          title: const Text('Estado de Batería'),
          subtitle: const Text('Cargando información...'),
          trailing: IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => _bluetoothService.requestBatteryStatus(),
          ),
        ),
      );
    }
    
    final battery = _batteryStatus!;
    IconData batteryIcon;
    Color batteryColor;
    
    if (battery.isCharging) {
      batteryIcon = Icons.battery_charging_full;
      batteryColor = Colors.green;
    } else if (battery.level < 20) {
      batteryIcon = Icons.battery_alert;
      batteryColor = Colors.red;
    } else if (battery.level < 50) {
      batteryIcon = Icons.battery_3_bar;
      batteryColor = Colors.orange;
    } else {
      batteryIcon = Icons.battery_full;
      batteryColor = Colors.green;
    }
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Estado de Batería',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Icon(batteryIcon, color: batteryColor, size: 32),
              ],
            ),
            const SizedBox(height: 12),
            LinearProgressIndicator(
              value: battery.level / 100,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(batteryColor),
              minHeight: 8,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(battery.statusText),
                Text(battery.levelText, style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Voltaje: ${battery.voltage.toStringAsFixed(2)}V'),
                Text('Temp: ${battery.temperature}°C'),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildConfigurationCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Configuración del Lector',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            
            // Potencia de lectura
            _buildSliderConfig(
              'Potencia de Lectura',
              _potencia,
              0,
              100,
              (value) => setState(() => _potencia = value),
              '${_potencia.toInt()}%',
            ),
            
            // Rango de lectura
            _buildSliderConfig(
              'Rango de Lectura',
              _rangoLectura,
              10,
              100,
              (value) => setState(() => _rangoLectura = value),
              '${_rangoLectura.toInt()} cm',
            ),
            
            const Divider(),
            
            // Opciones booleanas
            SwitchListTile(
              title: const Text('Sonido al leer'),
              subtitle: const Text('Emitir sonido cuando se lee un chip'),
              value: _sonidoExito,
              onChanged: (value) => setState(() => _sonidoExito = value),
            ),
            SwitchListTile(
              title: const Text('Vibración al leer'),
              subtitle: const Text('Vibrar cuando se lee un chip'),
              value: _vibracionExito,
              onChanged: (value) => setState(() => _vibracionExito = value),
            ),
            SwitchListTile(
              title: const Text('LED indicador'),
              subtitle: const Text('Mostrar LED cuando está activo'),
              value: _ledIndicador,
              onChanged: (value) => setState(() => _ledIndicador = value),
            ),
            
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _applyConfiguration,
                icon: const Icon(Icons.save),
                label: const Text('Aplicar Configuración'),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildSliderConfig(
    String label,
    double value,
    double min,
    double max,
    ValueChanged<double> onChanged,
    String valueLabel,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label),
            Text(valueLabel, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        Slider(
          value: value,
          min: min,
          max: max,
          divisions: ((max - min) / 10).round(),
          onChanged: onChanged,
        ),
      ],
    );
  }
  
  Widget _buildActionsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Acciones',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 3,
              children: [
                ElevatedButton.icon(
                  onPressed: _testReading,
                  icon: const Icon(Icons.nfc),
                  label: const Text('Probar Lectura'),
                ),
                ElevatedButton.icon(
                  onPressed: _calibrate,
                  icon: const Icon(Icons.tune),
                  label: const Text('Calibrar'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // TODO: Implementar actualización de firmware
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Función en desarrollo')),
                    );
                  },
                  icon: const Icon(Icons.system_update),
                  label: const Text('Actualizar'),
                ),
                ElevatedButton.icon(
                  onPressed: _loadDiagnostics,
                  icon: const Icon(Icons.analytics),
                  label: const Text('Diagnóstico'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildDiagnosticsCard() {
    final diag = _diagnostics!;
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Diagnóstico del Sistema',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            
            // Estadísticas de lectura
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Lecturas Totales'),
                      Text('${diag.totalReadings}', style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        flex: diag.successfulReadings,
                        child: Container(
                          height: 20,
                          color: Colors.green,
                          child: Center(
                            child: Text(
                              '${diag.successfulReadings}',
                              style: const TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ),
                        ),
                      ),
                      if (diag.failedReadings > 0)
                        Expanded(
                          flex: diag.failedReadings,
                          child: Container(
                            height: 20,
                            color: Colors.red,
                            child: Center(
                              child: Text(
                                '${diag.failedReadings}',
                                style: const TextStyle(color: Colors.white, fontSize: 10),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Tasa de éxito: ${diag.successRate.toStringAsFixed(1)}%',
                    style: TextStyle(
                      color: diag.successRate > 90 ? Colors.green : Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 12),
            _buildInfoRow('Memoria libre', '${(diag.freeMemory / 1024).toStringAsFixed(1)} KB'),
            _buildInfoRow('Temperatura', '${diag.temperature}°C'),
            _buildInfoRow('Señal', '${diag.signalStrength} dBm'),
            if (diag.lastError != null)
              _buildInfoRow('Último error', diag.lastError!, isError: true),
          ],
        ),
      ),
    );
  }
  
  Widget _buildInfoRow(String label, String value, {bool isError = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: isError ? Colors.red : Colors.grey)),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: isError ? Colors.red : null,
            ),
          ),
        ],
      ),
    );
  }
}