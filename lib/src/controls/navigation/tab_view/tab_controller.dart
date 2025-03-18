import 'package:fluent_ui3/fluent_ui.dart';
import 'package:flutter/foundation.dart';

/// A controller for [TabView].
///
/// Allows managing tabs dynamically including updating tab text.
class TabController extends ChangeNotifier {
  /// Creates a [TabController]
  TabController({
    required List<Tab> tabs,
    int initialIndex = 0,
  })  : _tabs = tabs,
        _selectedIndex = initialIndex;

  /// The tabs managed by this controller
  List<Tab> _tabs;
  
  /// Gets the current tabs
  List<Tab> get tabs => _tabs;

  /// The current selected index
  int _selectedIndex;
  
  /// Gets the current selected index
  int get selectedIndex => _selectedIndex;
  
  /// Sets the selected index and notifies listeners
  set selectedIndex(int value) {
    if (_selectedIndex != value) {
      _selectedIndex = value;
      notifyListeners();
    }
  }

  /// Updates the text of a tab at a specific index
  void updateTabText(int index, String newText) {
    assert(index >= 0 && index < _tabs.length, 'Index out of bounds');
    _tabs[index].updateText(newText);
  }
  
  /// Updates the text of the currently selected tab
  void updateCurrentTabText(String newText) {
    updateTabText(_selectedIndex, newText);
  }
  
  /// Adds a new tab
  void addTab(Tab tab) {
    _tabs.add(tab);
    notifyListeners();
  }
  
  /// Removes a tab at a specific index
  void removeTab(int index) {
    assert(index >= 0 && index < _tabs.length, 'Index out of bounds');
    _tabs.removeAt(index);
    if (_selectedIndex >= _tabs.length) {
      _selectedIndex = _tabs.isEmpty ? -1 : _tabs.length - 1;
    }
    notifyListeners();
  }
  
  @override
  void dispose() {
    super.dispose();
  }
}
