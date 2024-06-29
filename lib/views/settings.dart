import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaana/providers/config_provider.dart';

class Settings extends ConsumerStatefulWidget {
  const Settings({super.key});

  @override
  ConsumerState<Settings> createState() => _SettingsState();
}

class _SettingsState extends ConsumerState<Settings> {
  final _apiUrlController = TextEditingController();
  final _animeServiceController = TextEditingController();
  final _videoResolutionController = TextEditingController();
  final _showSubOrDubController = TextEditingController();

  final List<String> animeServices = ['gogoanime'];
  final List<String> videoResolutions = ['360p', '480p', '720p', '1080p'];
  final List<String> showSubOrDub = ['sub', 'dub', 'both'];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final config = ref.watch(configProvider);
    _apiUrlController.text = config.apiUrl;

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 16.0, bottom: 16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text('API Server'),
                    SizedBox(
                      width: 250,
                      child: TextField(
                        controller: _apiUrlController,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          ref
                              .read(configProvider.notifier)
                              .update(apiUrl: value);
                        },
                        enabled: false,
                      ),
                    ),
                    Text('Service'),
                    DropdownMenu(
                      controller: _animeServiceController,
                      initialSelection: config.animeService,
                      dropdownMenuEntries: animeServices.map((service) {
                        return DropdownMenuEntry(
                            value: service, label: service);
                      }).toList(),
                      onSelected: (value) {
                        ref
                            .read(configProvider.notifier)
                            .update(animeService: value);
                      },
                    ),
                    Text('Video Resolution'),
                    DropdownMenu(
                      controller: _videoResolutionController,
                      initialSelection: config.videoResolution,
                      dropdownMenuEntries: videoResolutions.map((resolution) {
                        return DropdownMenuEntry(
                            value: resolution, label: resolution);
                      }).toList(),
                      onSelected: (value) {
                        ref
                            .read(configProvider.notifier)
                            .update(videoResolution: value);
                      },
                    ),
                    Text('Sub or Dub'),
                    DropdownMenu(
                      onSelected: (value) {
                        ref
                            .read(configProvider.notifier)
                            .update(showSubOrDub: value.toString());
                      },
                      controller: _showSubOrDubController,
                      initialSelection: config.showSubOrDub,
                      dropdownMenuEntries: showSubOrDub.map((option) {
                        return DropdownMenuEntry(value: option, label: option);
                      }).toList(),
                    ),
                    Text('Save History'),
                    Switch(
                        value: config.saveHistory,
                        onChanged: (value) {
                          ref
                              .read(configProvider.notifier)
                              .update(saveHistory: value);
                        }),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
