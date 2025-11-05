/// Sync status for local data
enum SyncStatus {
  local, // Only on device
  synced, // Synced to cloud
  pending, // Waiting to sync
  conflict; // Sync conflict

  bool get isSynced => this == SyncStatus.synced;
  bool get needsSync => this == SyncStatus.local || this == SyncStatus.pending;
}
