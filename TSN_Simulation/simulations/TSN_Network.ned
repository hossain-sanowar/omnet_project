//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

package tsn_simulation.simulations;

import inet.node.inet.StandardHost;
import inet.node.ethernet.EtherSwitch;
import inet.linklayer.ethernet.EthLink;

network TSN_Network {
    submodules:
        host1: StandardHost {
            parameters:
                @display("p=100,100");
                numApps = 1;
                app[0].typename = "TSN_TrafficGenerator";
        }
        host2: StandardHost {
            parameters:
                @display("p=300,100");
                numApps = 1;
                app[0].typename = "TSN_TrafficSink";  // Add a sink for traffic
        }
        switch: EtherSwitch {
            parameters:
                @display("p=200,100");
                mac.qos = true;  // Enable QoS for TSN
        }
    connections:
        host1.ethg[0] <--> EthLink <--> switch.ethg[0];
        switch.ethg[1] <--> EthLink <--> host2.ethg[0];
}
