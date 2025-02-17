import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileCreationState with ChangeNotifier {
  int _currentStep = 0;
  final List<String> _selectedTopics = [];
  final List<String> _selectedPlaces = [];

  int get currentStep => _currentStep;
  List<String> get selectedTopics => _selectedTopics;
  List<String> get selectedPlaces => _selectedPlaces;

  void nextStep() {
    if (_currentStep < 2) {
      _currentStep++;
      notifyListeners();
    }
  }

  void previousStep() {
    if (_currentStep > 0) {
      _currentStep--;
      notifyListeners();
    }
  }

  void toggleTopic(String topic) {
    if (_selectedTopics.contains(topic)) {
      _selectedTopics.remove(topic);
    } else {
      _selectedTopics.add(topic);
    }
    notifyListeners();
  }

  void togglePlace(String place) {
    if (_selectedPlaces.contains(place)) {
      _selectedPlaces.remove(place);
    } else {
      _selectedPlaces.add(place);
    }
    notifyListeners();
  }
}

class ProfileCreationScreen extends StatelessWidget {
  const ProfileCreationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Creation'),
      ),
      body: Consumer<ProfileCreationState>(
        builder: (context, state, child) {
          return Column(
            children: [
              LinearProgressIndicator(
                value: (state.currentStep + 1) / 3,
                backgroundColor: Colors.white,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              ),
              Expanded(
                child: IndexedStack(
                  index: state.currentStep,
                  children: [
                    _Step1(),
                    _Step2(),
                    _Step3(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (state.currentStep > 0)
                      ElevatedButton(
                        onPressed: state.previousStep,
                        child: const Text('Back'),
                      ),
                    ElevatedButton(
                      onPressed: state.nextStep,
                      child: const Text('Next'),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _Step1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Step 1: Choose your table topics'),
          Wrap(
            spacing: 8.0,
            children: ['Travel', 'Music', 'Technology', 'Graphic Design', 'Italian Food']
                .map((topic) => FilterChip(
              label: Text(topic),
              selected: context.read<ProfileCreationState>().selectedTopics.contains(topic),
              onSelected: (bool selected) {
                context.read<ProfileCreationState>().toggleTopic(topic);
              },
            ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _Step2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Step 2: Your table topics'),
          Wrap(
            spacing: 8.0,
            children: context.read<ProfileCreationState>().selectedTopics
                .map((topic) => Chip(
              label: Text(topic),
            ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _Step3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Step 3: Select places'),
          Wrap(
            spacing: 8.0,
            children: ['Place 1', 'Place 2', 'Place 3']
                .map((place) => FilterChip(
              label: Text(place),
              selected: context.read<ProfileCreationState>().selectedPlaces.contains(place),
              onSelected: (bool selected) {
                context.read<ProfileCreationState>().togglePlace(place);
              },
            ))
                .toList(),
          ),
        ],
      ),
    );
  }
}