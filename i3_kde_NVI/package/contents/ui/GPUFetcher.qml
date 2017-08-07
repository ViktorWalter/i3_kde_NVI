/*
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

import QtQuick 2.2

Item {
    id: gpuFetcher

    property var gpuFetcherPlugin: null
    property bool gpuFetcherFailedToInitialize: false
    
    function getGPUFetcherPlugin() {
        
        if (gpuFetcherPlugin !== null) {
            return gpuFetcherPlugin
        }
        
        if (!gpuFetcherFailedToInitialize) {
            console.log('Initializing gpuFetcher plugin...')
            try {
                gpuFetcherPlugin = Qt.createQmlObject('import org.kde.private.gpufetcher 1.0 as WW; WW.GPUFetcher {}', gpuFetcher, 'GPUFetcher')
                console.log('GPUFetcher plugin initialized successfully!')
            }catch (e) {
                console.exception('ERROR: GPUFetcher plugin FAILED to initialize -->', e)
                gpuFetcherFailedToInitialize = true
            }
        }
        
        return gpuFetcherPlugin
    }
    
    function getGPUStr() {
        
        var plugin = getGPUFetcherPlugin()
        if (plugin) {
            var result = plugin.getGPUStr()
            if(result == ""){
                console.error("plugin.getGPUStr() returned empty string")
            }
        return result
            
        } else {
            console.exception('ERROR: Getting the GPU string - GPUFetcher plugin not available')
        }
    }
}
