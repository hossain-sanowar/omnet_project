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

package signalsandgateways.gateway.buffering;

//
// This module buffers incoming frames and groups incoming frames corresponding to the xml configuration. 
//
// @see ~IGatewayBuffering
//
// @author Stefan Buschmann, Timo Haeckel
//
simple AccumulationGatewayBuffering like IGatewayBuffering
{
    parameters:    	
    	@signal[pool*MessageSize](type=unsigned long);
    	@signal[pool*HoldUpTime](type=simtime_t);
    	
    	//Statistic about the poolMessage size which are forwarded to the next module
    	@statisticTemplate[poolMessageSize](title="pool size ($name)"; record=count,sum,mean,min,max, "vector(last)"; interpolationmode=linear); 	
    	//Statistic about the time each frame within a pool was hold back.
    	@statisticTemplate[poolHoldUpTime](title="Pool-Hold-Up-Time ($name)"; record=mean,max,min,vector; interpolationmode=sample-hold);
    	
    	//Path of the gateway configuration xml file
    	xml configXML;
        
        //Gateway ID in gateway config file. If auto or empty the gateway module name will be used.
        string gatewayID = default("auto");
    	
    gates:
        input in;
        output out;
}
