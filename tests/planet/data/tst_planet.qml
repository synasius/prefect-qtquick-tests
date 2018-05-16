import QtQuick 2.10
import QtTest 1.1

import Prefect 1.0


TestCase {
    id: testCase
    width: 300; height: 300
    visible: true
    when: windowShown
    name: "Planet"

    Component {
        id: planetComponent
        Planet { objectName: "planet1" }
    }

    function test_planet_grow_when_clicked() {
        var planet = planetComponent.createObject(testCase);
        verify(planet);

        compare(planet.width, 50);
        mouseClick(planet);
        compare(planet.width, 55);

        // destroy the planet
        planet.destroy();
    }
}
