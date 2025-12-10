import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

//for getting the current network status
@singleton
class ConnectivityHelper {
  final Connectivity _connectivity;
  final StreamController<bool> _connectionStatusController;
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  // Public stream that other widgets can listen to
  Stream<bool> get connectionStatusStream => _connectionStatusController.stream;

  // Current connection status
  bool _isConnected = false;
  bool get isConnected => _isConnected;

  ConnectivityHelper(this._connectivity)
    : _connectionStatusController = StreamController<bool>.broadcast();

  /// MUST be called before using isConnected()
  Future<void> init() async {
    try {
      await _initializeConnectionStatus();
      _setupConnectivityListener();
    } catch (_) {
      _isConnected = false;
      _connectionStatusController.add(false);
    }
  }

  // Initialize the connection status
  Future<void> _initializeConnectionStatus() async {
    try {
      final results = await _connectivity.checkConnectivity();
      _updateConnectionStatus(results);
    } catch (e) {
      _connectionStatusController.add(false);
      _isConnected = false;
    }
  }

  // Set up the connectivity listener
  void _setupConnectivityListener() {
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      _updateConnectionStatus,
    );
  }

  // Update the connection status based on connectivity results
  void _updateConnectionStatus(List<ConnectivityResult> results) {
    // Consider connected if any result is not 'none'
    _isConnected = results.any(
      (result) =>
          result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi,
    );
    _connectionStatusController.add(_isConnected);
  }

  // Dispose method to clean up resources
  void dispose() {
    _connectivitySubscription?.cancel();
    _connectionStatusController.close();
  }
}
