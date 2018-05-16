import qbs
import qbs.FileInfo


Project {
    CppApplication {
        name: "tst_planets"
        type: ["application", "autotest"]

        Depends { name: "Qt.qmltest" }

        //Depends { name: "quickpaths" }
        //quickpaths.additionalImportPaths: ["qrc:/qml"]

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
