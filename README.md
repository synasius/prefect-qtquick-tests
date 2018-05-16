# Prefect: Qt Quick Tests with QBS

This is a playground project that shows how we can use a custom test runner
and a module to run Qt Quick tests specifying additional import paths.


## quickpaths module

In the `qbs/modules` directory I defined a new `quickpaths` module
which can be used in a product marked with the `autotest` type to specify
additional import paths.

The usage is straightforward:

    Project {
        CppApplication {
            name: "tst_stuff"
            type: ["application", "autotest"]

            // we depend on quickpaths so we can provide additional
            // import paths to the test runner
            Depends { name: "quickpaths" }
            quickpaths.additionalImportPaths: ["qrc:/qml"]

            // ....
        }
    }

## A custom test runner

In the `qbs/imports` directory I defined a custom `TestRunner` which basically
behaves the same as the original `AutotestRunner` that comes with QBS.

The main difference is that `TestRunner` takes into account the `additionalImportPaths`
property of the `quickpaths` module when it is defined and it invokes the tests
with proper imports paths.

The usage is very simple, just replace the `AutotestRunner` with `TestRunner`

## Running the prefect project's tests

From the command line you can run:

    qbs build -p autotest-runner
