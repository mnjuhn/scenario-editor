$a = window.sirius;
$a.fileText = '<?xml version="1.0" encoding="utf-8"?>\<scenario id="null" name="null" schemaVersion="1.0.19">\
   <settings>\
      <units>US</units>\
   </settings>\
   <InitialDensitySet/>\
   <SplitRatioProfileSet>\
      <splitratioProfile dt="300" node_id="-2">\
         <splitratio link_in="-1" link_out="-2">1.000000</splitratio>\
      </splitratioProfile>\
      <splitratioProfile dt="300" node_id="-3">\
         <splitratio link_in="-2" link_out="-3">1.000000</splitratio>\
         <splitratio link_in="-6" link_out="-3">1.000000</splitratio>\
      </splitratioProfile>\
      <splitratioProfile dt="300" node_id="-4">\
         <splitratio link_in="-3" link_out="-4">1.000000</splitratio>\
         <splitratio link_in="-3" link_out="-7">0.000000</splitratio>\
      </splitratioProfile>\
      <splitratioProfile dt="300" node_id="-5">\
         <splitratio link_in="-4" link_out="-5">1.000000</splitratio>\
      </splitratioProfile>\
   </SplitRatioProfileSet>\
   <EventSet>\
      <event enabled="true" id="0" reset_to_nominal="true" tstamp="10980" type="link_lanes">\
         <description/>\
         <lane_count_change delta="1"/>\
         <display_position>\
            <point lat="37.8649695878758" lng="-122.302958965302"/>\
         </display_position>\
         <targetElements>\
            <scenarioElement id="-3" type="link"/>\
         </targetElements>\
      </event>\
   </EventSet>\
   <DemandProfileSet>\
      <demandProfile dt="300" knob="1" link_id_origin="-6">400.000000</demandProfile>\
      <demandProfile dt="300" knob="1" link_id_origin="-1">100.000000</demandProfile>\
   </DemandProfileSet>\
   <ControllerSet>\
      <controller dt="300" id="0" name="New Controller" type="IRM_alinea">\
         <parameters/>\
         <display_position>\
            <point lat="37.8491120765346" lng="-122.298152446747"/>\
         </display_position>\
         <PlanSequence transition_delay="0"/>\
         <PlanList/>\
         <targetElements>\
            <scenarioElement id="-2" type="link"/>\
         </targetElements>\
      </controller>\
   </ControllerSet>\
   <SensorList>\
      <sensor id="-1" link_type="freeway" type="static_point">\
         <description>University Ave</description>\
         <position>\
            <point lat="37.856225" lng="-122.300735"/>\
         </position>\
         <display_position>\
            <point lat="37.856225" lng="-122.300735"/>\
         </display_position>\
         <parameters>\
            <parameter name="lanes" value="5"/>\
            <parameter name="postmile" value="10.4"/>\
            <parameter name="length" value="0.38"/>\
            <parameter name="hwy_dir" value="E"/>\
            <parameter name="vds" value="400679"/>\
            <parameter name="start_time" value="0"/>\
            <parameter name="hwy_name" value="80"/>\
            <parameter name="offset_in_link" value="0"/>\
            <parameter name="data_id" value="400679"/>\
         </parameters>\
         <data_sources>\
            <data_source dt="300" format="PeMS Data Clearinghouse" url="pems:d4, Jan 1, 2011"/>\
         </data_sources>\
         <link_reference id="-1"/>\
      </sensor>\
   </SensorList>\
   <SignalList>\
      <signal id="-1" node_id="-5">\
         <phase lag="false" min_green_time="10" nema="1" permissive="false" protected="true" recall="false" red_clear_time="2" yellow_time="2">\
            <links/>\
         </phase>\
         <phase lag="false" min_green_time="10" nema="2" permissive="false" protected="true" recall="false" red_clear_time="2" yellow_time="2">\
            <links>\
               <link_reference id="-5"/>\
            </links>\
         </phase>\
         <phase lag="false" min_green_time="0" nema="3" permissive="true" protected="false" recall="false" red_clear_time="0" yellow_time="0">\
            <links/>\
         </phase>\
         <phase lag="false" min_green_time="10" nema="4" permissive="false" protected="true" recall="false" red_clear_time="2" yellow_time="2">\
            <links>\
               <link_reference id="-7"/>\
            </links>\
         </phase>\
         <phase lag="false" min_green_time="10" nema="5" permissive="false" protected="true" recall="false" red_clear_time="2" yellow_time="2">\
            <links/>\
         </phase>\
         <phase lag="false" min_green_time="10" nema="6" permissive="false" protected="true" recall="false" red_clear_time="2" yellow_time="2">\
            <links>\
               <link_reference id="-11"/>\
            </links>\
         </phase>\
         <phase lag="false" min_green_time="0" nema="7" permissive="true" protected="false" recall="false" red_clear_time="0" yellow_time="0">\
            <links/>\
         </phase>\
         <phase lag="false" min_green_time="10" nema="8" permissive="false" protected="true" recall="false" red_clear_time="2" yellow_time="2">\
            <links>\
               <link_reference id="-8"/>\
            </links>\
         </phase>\
      </signal>\
   </SignalList>\
   \
   <FundamentalDiagramProfileSet>\
      <fundamentalDiagramProfile link_id="-1">\
         <fundamentalDiagram capacity="1800" capacity_drop="0" congestion_speed="15" jam_density="150" free_flow_speed="60"/>\
      </fundamentalDiagramProfile>\
      <fundamentalDiagramProfile link_id="-2">\
         <fundamentalDiagram capacity="1800" capacity_drop="0" congestion_speed="15" jam_density="150" free_flow_speed="60"/>\
      </fundamentalDiagramProfile>\
      <fundamentalDiagramProfile link_id="-3">\
         <fundamentalDiagram capacity="1800" capacity_drop="0" congestion_speed="15" jam_density="150" free_flow_speed="60"/>\
      </fundamentalDiagramProfile>\
      <fundamentalDiagramProfile link_id="-4">\
         <fundamentalDiagram capacity="300" capacity_drop="0" congestion_speed="2.5" jam_density="150" free_flow_speed="10"/>\
      </fundamentalDiagramProfile>\
      <fundamentalDiagramProfile link_id="-5">\
         <fundamentalDiagram capacity="1800" capacity_drop="0" congestion_speed="15" jam_density="150" free_flow_speed="60"/>\
      </fundamentalDiagramProfile>\
      <fundamentalDiagramProfile link_id="-6">\
         <fundamentalDiagram capacity="1800" capacity_drop="0" congestion_speed="15" jam_density="150" free_flow_speed="60"/>\
      </fundamentalDiagramProfile>\
      <fundamentalDiagramProfile link_id="-7">\
         <fundamentalDiagram capacity="1800" capacity_drop="0" congestion_speed="15" jam_density="150" free_flow_speed="60"/>\
      </fundamentalDiagramProfile>\
   </FundamentalDiagramProfileSet>\
   <NetworkList>\
      <network dt="5" id="-1" name="New Network">\
         <description>Created by Network Editor version xsd-1.0.19-3-g692e428</description>\
         <position>\
            <point lat="37.857985471963" lng="-122.300827883184"/>\
         </position>\
         <NodeList>\
            <node id="-1" name="1" type="terminal">\
               <outputs>\
                  <output link_id="-1"/>\
               </outputs>\
               <inputs/>\
               <position>\
                  <point lat="37.8399873791942" lng="-122.296725511551"/>\
               </position>\
            </node>\
            <node id="-2" name="2" type="simple">\
               <outputs>\
                  <output link_id="-2"/>\
               </outputs>\
               <inputs>\
                  <input link_id="-1"/>\
               </inputs>\
               <position>\
                  <point lat="37.8437831193107" lng="-122.297605276108"/>\
               </position>\
            </node>\
            <node id="-3" name="3" type="simple">\
               <outputs>\
                  <output link_id="-3"/>\
               </outputs>\
               <inputs>\
                  <input link_id="-2"/>\
                  <input link_id="-6"/>\
               </inputs>\
               <position>\
                  <point lat="37.8524075346173" lng="-122.299579381943"/>\
               </position>\
            </node>\
            <node id="-4" name="4" type="simple">\
               <outputs>\
                  <output link_id="-4"/>\
                  <output link_id="-7"/>\
               </outputs>\
               <inputs>\
                  <input link_id="-3"/>\
               </inputs>\
               <position>\
                  <point lat="37.8639002449351" lng="-122.302840411663"/>\
               </position>\
            </node>\
            <node id="-5" name="5" type="simple">\
               <outputs>\
                  <output link_id="-5"/>\
               </outputs>\
               <inputs>\
                  <input link_id="-4"/>\
               </inputs>\
               <position>\
                  <point lat="37.8713302695572" lng="-122.305008172989"/>\
               </position>\
            </node>\
            <node id="-6" name="6" type="terminal">\
               <outputs/>\
               <inputs/>\
               <position>\
                  <point lat="37.8764455192813" lng="-122.306660413742"/>\
               </position>\
            </node>\
            <node id="-7" name="7" type="terminal">\
               <outputs/>\
               <inputs/>\
               <position>\
                  <point lat="37.8490527738834" lng="-122.296017408371"/>\
               </position>\
            </node>\
            <node id="-8" name="8" type="terminal">\
               <outputs/>\
               <inputs/>\
               <position>\
                  <point lat="37.8669769349244" lng="-122.302186489105"/>\
               </position>\
            </node>\
         </NodeList>\
         <LinkList>\
            <link id="-1" lanes="1" length="0.266743692783592" name="1" record="true" road_name="I-80 E" type="freeway">\
               <description/>\
               <begin node_id="-1"/>\
               <end node_id="-2"/>\
               <dynamics type="CTM"/>\
            </link>\
            <link id="-2" lanes="1" length="0.606473482246043" name="2" record="true" road_name="I-80 E" type="freeway">\
               <description/>\
               <begin node_id="-2"/>\
               <end node_id="-3"/>\
               <dynamics type="CTM"/>\
            </link>\
            <link id="-3" lanes="1" length="0.814669238313652" name="3" record="true" road_name="I-80 E" type="freeway">\
               <description/>\
               <begin node_id="-3"/>\
               <end node_id="-4"/>\
               <dynamics type="CTM"/>\
            </link>\
            <link id="-4" lanes="1" length="0.527494326813265" name="4" record="true" road_name="I-80 E" type="freeway">\
               <description/>\
               <begin node_id="-4"/>\
               <end node_id="-5"/>\
               <dynamics type="CTM"/>\
            </link>\
            <link id="-5" lanes="1" length="0.364901146966108" name="5" record="true" road_name="I-80 E" type="freeway">\
               <description/>\
               <begin node_id="-5"/>\
               <end node_id="-6"/>\
               <dynamics type="CTM"/>\
            </link>\
            <link id="-6" lanes="1" length="0.372088439716414" name="6" record="true" road_name="null" type="onramp">\
               <description/>\
               <begin node_id="-7"/>\
               <end node_id="-3"/>\
               <dynamics type="CTM"/>\
            </link>\
            <link id="-7" lanes="1" length="0.239126877222358" name="7" record="true" road_name="University Ave" type="offramp">\
               <description/>\
               <begin node_id="-4"/>\
               <end node_id="-8"/>\
               <dynamics type="CTM"/>\
            </link>\
         </LinkList>\
      </network>\
   </NetworkList>\
</scenario>';