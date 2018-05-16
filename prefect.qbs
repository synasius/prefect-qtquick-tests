import qbs

Project {
    qbsSearchPaths: "qbs"

    references: [
        "src/src.qbs",
        "tests/tests.qbs"
    ]
}
