import qbs
import qbs.File
import qbs.FileInfo
import qbs.ModUtils
import qbs.Utilities


Product {
    name: "autotest-runner"
    type: ["autotest-result"]
    builtByDefault: false
    property stringList arguments: []
    property stringList environment: ModUtils.flattenDictionary(qbs.commonRunEnvironment)
    property bool limitToSubProject: true
    property stringList wrapper: []
    Depends {
        productTypes: "autotest"
        limitToSubProject: product.limitToSubProject
    }
    Rule {
        inputsFromDependencies: "application"
        Artifact {
            filePath: Utilities.getHash(input.filePath) + ".result.dummy" // Will never exist.
            fileTags: "autotest-result"
            alwaysUpdated: false
        }
        prepare: {
            var commandFilePath;
            var installed = input.moduleProperty("qbs", "install");

            // beginning of the custom part
            var args = [];
            args = args.concat(product.arguments);
            // here we get alle the additional import paths from the quickpaths module
            var additionalImportPaths = input.moduleProperty("quickpaths", "additionalImportPaths");
            // and we push them to args list
            for (var i in additionalImportPaths) {
                args.push("-import", additionalImportPaths[i]);
            }

            if (installed)
                commandFilePath = ModUtils.artifactInstalledFilePath(input);
            if (!commandFilePath || !File.exists(commandFilePath))
                commandFilePath = input.filePath;
            var fullCommandLine = product.wrapper
                .concat([commandFilePath])
                .concat(args); // we use args here instead of product.arguments
            var cmd = new Command(fullCommandLine[0], fullCommandLine.slice(1));
            cmd.description = "Running test " + input.fileName;
            cmd.environment = product.environment;
            return cmd;
        }
    }
}
