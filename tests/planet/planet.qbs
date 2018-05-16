import qbs
import qbs.FileInfo


Project {
    CppApplication {
        name: "tst_planets"
        type: ["application", "autotest"]

        Depends { name: "Qt.qmltest" }

        // we depend on quickpaths so we can provide additional
        // import paths to the test runner
        Depends { name: "quickpaths" }
        quickpaths.additionalImportPaths: ["qrc:/qml"]

        files: [
            "tst_planet.cpp",
            "../../src/qml.qrc",
        ]

        Group {
            name: "testdata"
            files: [
                "data/tst_*.qml",
            ]
        }
    }
}
