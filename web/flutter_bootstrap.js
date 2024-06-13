{{flutter_js}}
{{flutter_build_config}}

_flutter.loader.load({
onEntrypointLoaded: async function(engineInitializer) {

        const appRunner = await engineInitializer.initializeEngine();

        var loadingElement = document.getElementById("loading");
        loadingElement?.remove();
        await appRunner.runApp();
    }
});