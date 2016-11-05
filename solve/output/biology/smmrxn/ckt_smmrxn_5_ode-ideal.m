%toplevel script
function main()
  preamble();
  build_comp_library();
  build_circuit();
end
%
%
%circuit build script
function build_circuit()
  add_block('simulink/Ports & Subsystems/Subsystem','ckt_smmrxn_5_ode-ideal/circuit');
  delete_line('ckt_smmrxn_5_ode-ideal/circuit','In1/1','Out1/1');
  delete_block('ckt_smmrxn_5_ode-ideal/circuit/In1');
  delete_block('ckt_smmrxn_5_ode-ideal/circuit/Out1');
  add_block('ckt_smmrxn_5_ode-ideal/library/input.I','ckt_smmrxn_5_ode-ideal/circuit/input.I[0]');
  add_block('ckt_smmrxn_5_ode-ideal/library/input.I','ckt_smmrxn_5_ode-ideal/circuit/input.I[1]');
  add_block('ckt_smmrxn_5_ode-ideal/library/output.V','ckt_smmrxn_5_ode-ideal/circuit/output.V[0]');
  add_block('ckt_smmrxn_5_ode-ideal/library/mm','ckt_smmrxn_5_ode-ideal/circuit/mm[0]');
  add_block('ckt_smmrxn_5_ode-ideal/library/input.V','ckt_smmrxn_5_ode-ideal/circuit/input.V[2]');
  add_block('ckt_smmrxn_5_ode-ideal/library/input.V','ckt_smmrxn_5_ode-ideal/circuit/input.V[0]');
  add_block('ckt_smmrxn_5_ode-ideal/library/input.V','ckt_smmrxn_5_ode-ideal/circuit/input.V[1]');
  add_line('ckt_smmrxn_5_ode-ideal/circuit','input.I[0]/1','mm[0]/1');
  add_line('ckt_smmrxn_5_ode-ideal/circuit','input.V[2]/1','mm[0]/5');
  add_line('ckt_smmrxn_5_ode-ideal/circuit','input.I[1]/1','mm[0]/4');
  add_line('ckt_smmrxn_5_ode-ideal/circuit','input.V[1]/1','mm[0]/2');
  add_line('ckt_smmrxn_5_ode-ideal/circuit','mm[0]/2','output.V[0]/1');
  add_line('ckt_smmrxn_5_ode-ideal/circuit','input.V[0]/1','mm[0]/3');
  add_block('simulink/Sources/Constant','ckt_smmrxn_5_ode-ideal/circuit/const_432');
  set_param('ckt_smmrxn_5_ode-ideal/circuit/const_432','Value','0.11');
  add_line('ckt_smmrxn_5_ode-ideal/circuit','const_432/1','input.V[0]/1');
  add_block('simulink/Sources/Constant','ckt_smmrxn_5_ode-ideal/circuit/const_434');
  set_param('ckt_smmrxn_5_ode-ideal/circuit/const_434','Value','0.');
  add_line('ckt_smmrxn_5_ode-ideal/circuit','const_434/1','input.V[1]/1');
  add_block('simulink/Sources/Constant','ckt_smmrxn_5_ode-ideal/circuit/const_436');
  set_param('ckt_smmrxn_5_ode-ideal/circuit/const_436','Value','0.15');
  add_line('ckt_smmrxn_5_ode-ideal/circuit','const_436/1','input.V[2]/1');
  add_block('simulink/Sources/Constant','ckt_smmrxn_5_ode-ideal/circuit/const_438');
  set_param('ckt_smmrxn_5_ode-ideal/circuit/const_438','Value','1.');
  add_line('ckt_smmrxn_5_ode-ideal/circuit','const_438/1','input.I[0]/1');
  add_block('simulink/Sources/Constant','ckt_smmrxn_5_ode-ideal/circuit/const_440');
  set_param('ckt_smmrxn_5_ode-ideal/circuit/const_440','Value','1.');
  add_line('ckt_smmrxn_5_ode-ideal/circuit','const_440/1','input.I[1]/1');
  add_block('simulink/Ports & Subsystems/Out1','ckt_smmrxn_5_ode-ideal/circuit/output.V[0]_out');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/circuit/_output.V[0]_out');
  add_line('ckt_smmrxn_5_ode-ideal/circuit','_output.V[0]_out/1','output.V[0]_out/1');
  add_line('ckt_smmrxn_5_ode-ideal/circuit','output.V[0]/1','_output.V[0]_out/1');
end
%
%
%preamble function
function preamble()
  %define model name
  model_name='ckt_smmrxn_5_ode-ideal';
  %create and open the model
  open_system(new_system(model_name));
  %set solver method
  set_param(model_name,'Solver','ode3');
end
%
%
%library assembly function
function build_comp_library()
  add_block('simulink/Ports & Subsystems/Subsystem','ckt_smmrxn_5_ode-ideal/library');
  delete_line('ckt_smmrxn_5_ode-ideal/library','In1/1','Out1/1');
  delete_block('ckt_smmrxn_5_ode-ideal/library/In1');
  delete_block('ckt_smmrxn_5_ode-ideal/library/Out1');
  %
  %
  %
  add_block('simulink/Ports & Subsystems/Subsystem','ckt_smmrxn_5_ode-ideal/library/mm');
  delete_line('ckt_smmrxn_5_ode-ideal/library/mm','In1/1','Out1/1');
  delete_block('ckt_smmrxn_5_ode-ideal/library/mm/In1');
  delete_block('ckt_smmrxn_5_ode-ideal/library/mm/Out1');
  add_block('simulink/Ports & Subsystems/In1','ckt_smmrxn_5_ode-ideal/library/mm/kr');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/mm/_kr');
  add_line('ckt_smmrxn_5_ode-ideal/library/mm','kr/1','_kr/1');
  add_block('simulink/Ports & Subsystems/In1','ckt_smmrxn_5_ode-ideal/library/mm/XY0');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/mm/_XY0');
  add_line('ckt_smmrxn_5_ode-ideal/library/mm','XY0/1','_XY0/1');
  add_block('simulink/Ports & Subsystems/In1','ckt_smmrxn_5_ode-ideal/library/mm/Ytot');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/mm/_Ytot');
  add_line('ckt_smmrxn_5_ode-ideal/library/mm','Ytot/1','_Ytot/1');
  add_block('simulink/Ports & Subsystems/In1','ckt_smmrxn_5_ode-ideal/library/mm/kf');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/mm/_kf');
  add_line('ckt_smmrxn_5_ode-ideal/library/mm','kf/1','_kf/1');
  add_block('simulink/Ports & Subsystems/In1','ckt_smmrxn_5_ode-ideal/library/mm/Xtot');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/mm/_Xtot');
  add_line('ckt_smmrxn_5_ode-ideal/library/mm','Xtot/1','_Xtot/1');
  add_block('simulink/Ports & Subsystems/Out1','ckt_smmrxn_5_ode-ideal/library/mm/X');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/mm/_X');
  add_line('ckt_smmrxn_5_ode-ideal/library/mm','_X/1','X/1');
  add_block('simulink/Ports & Subsystems/Out1','ckt_smmrxn_5_ode-ideal/library/mm/XY');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/mm/_XY');
  add_line('ckt_smmrxn_5_ode-ideal/library/mm','_XY/1','XY/1');
  add_block('simulink/Ports & Subsystems/Out1','ckt_smmrxn_5_ode-ideal/library/mm/Y');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/mm/_Y');
  add_line('ckt_smmrxn_5_ode-ideal/library/mm','_Y/1','Y/1');
  add_block('simulink/Math Operations/Sum','ckt_smmrxn_5_ode-ideal/library/mm/sum_39');
  set_param('ckt_smmrxn_5_ode-ideal/library/mm/sum_39','Inputs','+-');
  add_line('ckt_smmrxn_5_ode-ideal/library/mm','_Xtot/1','sum_39/1');
  add_line('ckt_smmrxn_5_ode-ideal/library/mm','_XY/1','sum_39/2');
  add_block('simulink/Math Operations/Product','ckt_smmrxn_5_ode-ideal/library/mm/mul_42');
  set_param('ckt_smmrxn_5_ode-ideal/library/mm/mul_42','Inputs','***');
  add_line('ckt_smmrxn_5_ode-ideal/library/mm','_kf/1','mul_42/1');
  add_line('ckt_smmrxn_5_ode-ideal/library/mm','_X/1','mul_42/2');
  add_line('ckt_smmrxn_5_ode-ideal/library/mm','_Y/1','mul_42/3');
  add_block('simulink/Math Operations/Product','ckt_smmrxn_5_ode-ideal/library/mm/mul_46');
  set_param('ckt_smmrxn_5_ode-ideal/library/mm/mul_46','Inputs','**');
  add_line('ckt_smmrxn_5_ode-ideal/library/mm','_kr/1','mul_46/1');
  add_line('ckt_smmrxn_5_ode-ideal/library/mm','_XY/1','mul_46/2');
  add_block('simulink/Math Operations/Sum','ckt_smmrxn_5_ode-ideal/library/mm/sum_49');
  set_param('ckt_smmrxn_5_ode-ideal/library/mm/sum_49','Inputs','+-');
  add_line('ckt_smmrxn_5_ode-ideal/library/mm','mul_42/1','sum_49/1');
  add_line('ckt_smmrxn_5_ode-ideal/library/mm','mul_46/1','sum_49/2');
  add_block('simulink/Continuous/Integrator','ckt_smmrxn_5_ode-ideal/library/mm/int_52');
  add_line('ckt_smmrxn_5_ode-ideal/library/mm','sum_49/1','int_52/1');
  add_line('ckt_smmrxn_5_ode-ideal/library/mm','int_52/1','_XY/1');
  add_block('simulink/Math Operations/Sum','ckt_smmrxn_5_ode-ideal/library/mm/sum_54');
  set_param('ckt_smmrxn_5_ode-ideal/library/mm/sum_54','Inputs','+-');
  add_line('ckt_smmrxn_5_ode-ideal/library/mm','_Ytot/1','sum_54/1');
  add_line('ckt_smmrxn_5_ode-ideal/library/mm','_XY/1','sum_54/2');
  %
  add_block('simulink/Ports & Subsystems/Subsystem','ckt_smmrxn_5_ode-ideal/library/vgain');
  delete_line('ckt_smmrxn_5_ode-ideal/library/vgain','In1/1','Out1/1');
  delete_block('ckt_smmrxn_5_ode-ideal/library/vgain/In1');
  delete_block('ckt_smmrxn_5_ode-ideal/library/vgain/Out1');
  add_block('simulink/Ports & Subsystems/In1','ckt_smmrxn_5_ode-ideal/library/vgain/X');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/vgain/_X');
  add_line('ckt_smmrxn_5_ode-ideal/library/vgain','X/1','_X/1');
  add_block('simulink/Ports & Subsystems/In1','ckt_smmrxn_5_ode-ideal/library/vgain/Y');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/vgain/_Y');
  add_line('ckt_smmrxn_5_ode-ideal/library/vgain','Y/1','_Y/1');
  add_block('simulink/Ports & Subsystems/In1','ckt_smmrxn_5_ode-ideal/library/vgain/Z');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/vgain/_Z');
  add_line('ckt_smmrxn_5_ode-ideal/library/vgain','Z/1','_Z/1');
  add_block('simulink/Ports & Subsystems/Out1','ckt_smmrxn_5_ode-ideal/library/vgain/P');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/vgain/_P');
  add_line('ckt_smmrxn_5_ode-ideal/library/vgain','_P/1','P/1');
  add_block('simulink/Math Operations/Product','ckt_smmrxn_5_ode-ideal/library/vgain/div_77');
  set_param('ckt_smmrxn_5_ode-ideal/library/vgain/div_77','Inputs','*/');
  add_line('ckt_smmrxn_5_ode-ideal/library/vgain','_X/1','div_77/1');
  add_line('ckt_smmrxn_5_ode-ideal/library/vgain','_Y/1','div_77/2');
  add_block('simulink/Sources/Constant','ckt_smmrxn_5_ode-ideal/library/vgain/const_80');
  set_param('ckt_smmrxn_5_ode-ideal/library/vgain/const_80','Value','0.04');
  add_block('simulink/Math Operations/Product','ckt_smmrxn_5_ode-ideal/library/vgain/mul_82');
  set_param('ckt_smmrxn_5_ode-ideal/library/vgain/mul_82','Inputs','***');
  add_line('ckt_smmrxn_5_ode-ideal/library/vgain','div_77/1','mul_82/1');
  add_line('ckt_smmrxn_5_ode-ideal/library/vgain','_Z/1','mul_82/2');
  add_line('ckt_smmrxn_5_ode-ideal/library/vgain','const_80/1','mul_82/3');
  %
  add_block('simulink/Ports & Subsystems/Subsystem','ckt_smmrxn_5_ode-ideal/library/switch');
  delete_line('ckt_smmrxn_5_ode-ideal/library/switch','In1/1','Out1/1');
  delete_block('ckt_smmrxn_5_ode-ideal/library/switch/In1');
  delete_block('ckt_smmrxn_5_ode-ideal/library/switch/Out1');
  add_block('simulink/Ports & Subsystems/In1','ckt_smmrxn_5_ode-ideal/library/switch/n');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/switch/_n');
  add_line('ckt_smmrxn_5_ode-ideal/library/switch','n/1','_n/1');
  add_block('simulink/Ports & Subsystems/In1','ckt_smmrxn_5_ode-ideal/library/switch/SUB');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/switch/_SUB');
  add_line('ckt_smmrxn_5_ode-ideal/library/switch','SUB/1','_SUB/1');
  add_block('simulink/Ports & Subsystems/In1','ckt_smmrxn_5_ode-ideal/library/switch/Kmod');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/switch/_Kmod');
  add_line('ckt_smmrxn_5_ode-ideal/library/switch','Kmod/1','_Kmod/1');
  add_block('simulink/Ports & Subsystems/In1','ckt_smmrxn_5_ode-ideal/library/switch/Vmax');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/switch/_Vmax');
  add_line('ckt_smmrxn_5_ode-ideal/library/switch','Vmax/1','_Vmax/1');
  add_block('simulink/Ports & Subsystems/Out1','ckt_smmrxn_5_ode-ideal/library/switch/PROD');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/switch/_PROD');
  add_line('ckt_smmrxn_5_ode-ideal/library/switch','_PROD/1','PROD/1');
  add_block('simulink/Math Operations/Product','ckt_smmrxn_5_ode-ideal/library/switch/div_111');
  set_param('ckt_smmrxn_5_ode-ideal/library/switch/div_111','Inputs','*/');
  add_line('ckt_smmrxn_5_ode-ideal/library/switch','_SUB/1','div_111/1');
  add_line('ckt_smmrxn_5_ode-ideal/library/switch','_Kmod/1','div_111/2');
  add_block('simulink/Sources/Constant','ckt_smmrxn_5_ode-ideal/library/switch/const_114');
  set_param('ckt_smmrxn_5_ode-ideal/library/switch/const_114','Value','1.');
  add_block('simulink/Math Operations/Sum','ckt_smmrxn_5_ode-ideal/library/switch/sub_116');
  set_param('ckt_smmrxn_5_ode-ideal/library/switch/sub_116','Inputs','++');
  add_line('ckt_smmrxn_5_ode-ideal/library/switch','div_111/1','sub_116/1');
  add_line('ckt_smmrxn_5_ode-ideal/library/switch','const_114/1','sub_116/2');
  add_block('simulink/Math Operations/Math Function','ckt_smmrxn_5_ode-ideal/library/switch/pow_119');
  set_param('ckt_smmrxn_5_ode-ideal/library/switch/pow_119','Function','pow');
  add_line('ckt_smmrxn_5_ode-ideal/library/switch','_n/1','pow_119/2');
  add_line('ckt_smmrxn_5_ode-ideal/library/switch','sub_116/1','pow_119/1');
  add_block('simulink/Math Operations/Product','ckt_smmrxn_5_ode-ideal/library/switch/div_122');
  set_param('ckt_smmrxn_5_ode-ideal/library/switch/div_122','Inputs','*/');
  add_line('ckt_smmrxn_5_ode-ideal/library/switch','_Vmax/1','div_122/1');
  add_line('ckt_smmrxn_5_ode-ideal/library/switch','pow_119/1','div_122/2');
  %
  add_block('simulink/Ports & Subsystems/Subsystem','ckt_smmrxn_5_ode-ideal/library/ihill');
  delete_line('ckt_smmrxn_5_ode-ideal/library/ihill','In1/1','Out1/1');
  delete_block('ckt_smmrxn_5_ode-ideal/library/ihill/In1');
  delete_block('ckt_smmrxn_5_ode-ideal/library/ihill/Out1');
  add_block('simulink/Ports & Subsystems/In1','ckt_smmrxn_5_ode-ideal/library/ihill/S');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/ihill/_S');
  add_line('ckt_smmrxn_5_ode-ideal/library/ihill','S/1','_S/1');
  add_block('simulink/Ports & Subsystems/In1','ckt_smmrxn_5_ode-ideal/library/ihill/Km');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/ihill/_Km');
  add_line('ckt_smmrxn_5_ode-ideal/library/ihill','Km/1','_Km/1');
  add_block('simulink/Ports & Subsystems/In1','ckt_smmrxn_5_ode-ideal/library/ihill/Vmax');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/ihill/_Vmax');
  add_line('ckt_smmrxn_5_ode-ideal/library/ihill','Vmax/1','_Vmax/1');
  add_block('simulink/Ports & Subsystems/Out1','ckt_smmrxn_5_ode-ideal/library/ihill/STIM');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/ihill/_STIM');
  add_line('ckt_smmrxn_5_ode-ideal/library/ihill','_STIM/1','STIM/1');
  add_block('simulink/Ports & Subsystems/Out1','ckt_smmrxn_5_ode-ideal/library/ihill/REP');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/ihill/_REP');
  add_line('ckt_smmrxn_5_ode-ideal/library/ihill','_REP/1','REP/1');
  add_block('simulink/Ports & Subsystems/In1','ckt_smmrxn_5_ode-ideal/library/ihill/n');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/ihill/_n');
  add_line('ckt_smmrxn_5_ode-ideal/library/ihill','n/1','_n/1');
  add_block('simulink/Math Operations/Product','ckt_smmrxn_5_ode-ideal/library/ihill/div_154');
  set_param('ckt_smmrxn_5_ode-ideal/library/ihill/div_154','Inputs','*/');
  add_line('ckt_smmrxn_5_ode-ideal/library/ihill','_S/1','div_154/1');
  add_line('ckt_smmrxn_5_ode-ideal/library/ihill','_Km/1','div_154/2');
  add_block('simulink/Math Operations/Math Function','ckt_smmrxn_5_ode-ideal/library/ihill/pow_157');
  set_param('ckt_smmrxn_5_ode-ideal/library/ihill/pow_157','Function','pow');
  add_line('ckt_smmrxn_5_ode-ideal/library/ihill','_n/1','pow_157/2');
  add_line('ckt_smmrxn_5_ode-ideal/library/ihill','div_154/1','pow_157/1');
  add_block('simulink/Math Operations/Product','ckt_smmrxn_5_ode-ideal/library/ihill/div_160');
  set_param('ckt_smmrxn_5_ode-ideal/library/ihill/div_160','Inputs','*/');
  add_line('ckt_smmrxn_5_ode-ideal/library/ihill','_S/1','div_160/1');
  add_line('ckt_smmrxn_5_ode-ideal/library/ihill','_Km/1','div_160/2');
  add_block('simulink/Math Operations/Math Function','ckt_smmrxn_5_ode-ideal/library/ihill/pow_163');
  set_param('ckt_smmrxn_5_ode-ideal/library/ihill/pow_163','Function','pow');
  add_line('ckt_smmrxn_5_ode-ideal/library/ihill','_n/1','pow_163/2');
  add_line('ckt_smmrxn_5_ode-ideal/library/ihill','div_160/1','pow_163/1');
  add_block('simulink/Sources/Constant','ckt_smmrxn_5_ode-ideal/library/ihill/const_166');
  set_param('ckt_smmrxn_5_ode-ideal/library/ihill/const_166','Value','1.');
  add_block('simulink/Math Operations/Sum','ckt_smmrxn_5_ode-ideal/library/ihill/sub_168');
  set_param('ckt_smmrxn_5_ode-ideal/library/ihill/sub_168','Inputs','++');
  add_line('ckt_smmrxn_5_ode-ideal/library/ihill','pow_163/1','sub_168/1');
  add_line('ckt_smmrxn_5_ode-ideal/library/ihill','const_166/1','sub_168/2');
  add_block('simulink/Math Operations/Product','ckt_smmrxn_5_ode-ideal/library/ihill/div_171');
  set_param('ckt_smmrxn_5_ode-ideal/library/ihill/div_171','Inputs','*/');
  add_line('ckt_smmrxn_5_ode-ideal/library/ihill','pow_157/1','div_171/1');
  add_line('ckt_smmrxn_5_ode-ideal/library/ihill','sub_168/1','div_171/2');
  add_block('simulink/Math Operations/Product','ckt_smmrxn_5_ode-ideal/library/ihill/mul_174');
  set_param('ckt_smmrxn_5_ode-ideal/library/ihill/mul_174','Inputs','**');
  add_line('ckt_smmrxn_5_ode-ideal/library/ihill','_Vmax/1','mul_174/1');
  add_line('ckt_smmrxn_5_ode-ideal/library/ihill','div_171/1','mul_174/2');
  add_block('simulink/Math Operations/Math Function','ckt_smmrxn_5_ode-ideal/library/ihill/pow_177');
  set_param('ckt_smmrxn_5_ode-ideal/library/ihill/pow_177','Function','pow');
  add_line('ckt_smmrxn_5_ode-ideal/library/ihill','_n/1','pow_177/2');
  add_line('ckt_smmrxn_5_ode-ideal/library/ihill','_Km/1','pow_177/1');
  add_block('simulink/Math Operations/Math Function','ckt_smmrxn_5_ode-ideal/library/ihill/pow_180');
  set_param('ckt_smmrxn_5_ode-ideal/library/ihill/pow_180','Function','pow');
  add_line('ckt_smmrxn_5_ode-ideal/library/ihill','_n/1','pow_180/2');
  add_line('ckt_smmrxn_5_ode-ideal/library/ihill','_S/1','pow_180/1');
  add_block('simulink/Math Operations/Math Function','ckt_smmrxn_5_ode-ideal/library/ihill/pow_183');
  set_param('ckt_smmrxn_5_ode-ideal/library/ihill/pow_183','Function','pow');
  add_line('ckt_smmrxn_5_ode-ideal/library/ihill','_n/1','pow_183/2');
  add_line('ckt_smmrxn_5_ode-ideal/library/ihill','_Km/1','pow_183/1');
  add_block('simulink/Math Operations/Sum','ckt_smmrxn_5_ode-ideal/library/ihill/sub_186');
  set_param('ckt_smmrxn_5_ode-ideal/library/ihill/sub_186','Inputs','++');
  add_line('ckt_smmrxn_5_ode-ideal/library/ihill','pow_180/1','sub_186/1');
  add_line('ckt_smmrxn_5_ode-ideal/library/ihill','pow_183/1','sub_186/2');
  add_block('simulink/Math Operations/Product','ckt_smmrxn_5_ode-ideal/library/ihill/div_189');
  set_param('ckt_smmrxn_5_ode-ideal/library/ihill/div_189','Inputs','*/');
  add_line('ckt_smmrxn_5_ode-ideal/library/ihill','pow_177/1','div_189/1');
  add_line('ckt_smmrxn_5_ode-ideal/library/ihill','sub_186/1','div_189/2');
  add_block('simulink/Math Operations/Product','ckt_smmrxn_5_ode-ideal/library/ihill/mul_192');
  set_param('ckt_smmrxn_5_ode-ideal/library/ihill/mul_192','Inputs','**');
  add_line('ckt_smmrxn_5_ode-ideal/library/ihill','_Vmax/1','mul_192/1');
  add_line('ckt_smmrxn_5_ode-ideal/library/ihill','div_189/1','mul_192/2');
  %
  add_block('simulink/Ports & Subsystems/Subsystem','ckt_smmrxn_5_ode-ideal/library/itov');
  delete_line('ckt_smmrxn_5_ode-ideal/library/itov','In1/1','Out1/1');
  delete_block('ckt_smmrxn_5_ode-ideal/library/itov/In1');
  delete_block('ckt_smmrxn_5_ode-ideal/library/itov/Out1');
  add_block('simulink/Ports & Subsystems/In1','ckt_smmrxn_5_ode-ideal/library/itov/X');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/itov/_X');
  add_line('ckt_smmrxn_5_ode-ideal/library/itov','X/1','_X/1');
  add_block('simulink/Ports & Subsystems/In1','ckt_smmrxn_5_ode-ideal/library/itov/K');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/itov/_K');
  add_line('ckt_smmrxn_5_ode-ideal/library/itov','K/1','_K/1');
  add_block('simulink/Ports & Subsystems/Out1','ckt_smmrxn_5_ode-ideal/library/itov/Y');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/itov/_Y');
  add_line('ckt_smmrxn_5_ode-ideal/library/itov','_Y/1','Y/1');
  add_block('simulink/Math Operations/Product','ckt_smmrxn_5_ode-ideal/library/itov/mul_210');
  set_param('ckt_smmrxn_5_ode-ideal/library/itov/mul_210','Inputs','**');
  add_line('ckt_smmrxn_5_ode-ideal/library/itov','_K/1','mul_210/1');
  add_line('ckt_smmrxn_5_ode-ideal/library/itov','_X/1','mul_210/2');
  %
  add_block('simulink/Ports & Subsystems/Subsystem','ckt_smmrxn_5_ode-ideal/library/output.I');
  delete_line('ckt_smmrxn_5_ode-ideal/library/output.I','In1/1','Out1/1');
  delete_block('ckt_smmrxn_5_ode-ideal/library/output.I/In1');
  delete_block('ckt_smmrxn_5_ode-ideal/library/output.I/Out1');
  add_block('simulink/Ports & Subsystems/In1','ckt_smmrxn_5_ode-ideal/library/output.I/X');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/output.I/_X');
  add_line('ckt_smmrxn_5_ode-ideal/library/output.I','X/1','_X/1');
  add_block('simulink/Ports & Subsystems/Out1','ckt_smmrxn_5_ode-ideal/library/output.I/O');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/output.I/_O');
  add_line('ckt_smmrxn_5_ode-ideal/library/output.I','_O/1','O/1');
  add_line('ckt_smmrxn_5_ode-ideal/library/output.I','_X/1','_O/1');
  %
  add_block('simulink/Ports & Subsystems/Subsystem','ckt_smmrxn_5_ode-ideal/library/output.V');
  delete_line('ckt_smmrxn_5_ode-ideal/library/output.V','In1/1','Out1/1');
  delete_block('ckt_smmrxn_5_ode-ideal/library/output.V/In1');
  delete_block('ckt_smmrxn_5_ode-ideal/library/output.V/Out1');
  add_block('simulink/Ports & Subsystems/In1','ckt_smmrxn_5_ode-ideal/library/output.V/X');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/output.V/_X');
  add_line('ckt_smmrxn_5_ode-ideal/library/output.V','X/1','_X/1');
  add_block('simulink/Ports & Subsystems/Out1','ckt_smmrxn_5_ode-ideal/library/output.V/O');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/output.V/_O');
  add_line('ckt_smmrxn_5_ode-ideal/library/output.V','_O/1','O/1');
  add_line('ckt_smmrxn_5_ode-ideal/library/output.V','_X/1','_O/1');
  %
  add_block('simulink/Ports & Subsystems/Subsystem','ckt_smmrxn_5_ode-ideal/library/input.V');
  delete_line('ckt_smmrxn_5_ode-ideal/library/input.V','In1/1','Out1/1');
  delete_block('ckt_smmrxn_5_ode-ideal/library/input.V/In1');
  delete_block('ckt_smmrxn_5_ode-ideal/library/input.V/Out1');
  add_block('simulink/Ports & Subsystems/In1','ckt_smmrxn_5_ode-ideal/library/input.V/X');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/input.V/_X');
  add_block('simulink/Discontinuities/Quantizer','ckt_smmrxn_5_ode-ideal/library/input.V/smp_239');
  set_param('ckt_smmrxn_5_ode-ideal/library/input.V/smp_239','Interval','1e-05');
  add_line('ckt_smmrxn_5_ode-ideal/library/input.V','X/1','smp_239/1');
  add_line('ckt_smmrxn_5_ode-ideal/library/input.V','smp_239/1','_X/1');
  add_block('simulink/Ports & Subsystems/Out1','ckt_smmrxn_5_ode-ideal/library/input.V/O');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/input.V/_O');
  add_line('ckt_smmrxn_5_ode-ideal/library/input.V','_O/1','O/1');
  %
  add_block('simulink/Ports & Subsystems/Subsystem','ckt_smmrxn_5_ode-ideal/library/copy.V');
  delete_line('ckt_smmrxn_5_ode-ideal/library/copy.V','In1/1','Out1/1');
  delete_block('ckt_smmrxn_5_ode-ideal/library/copy.V/In1');
  delete_block('ckt_smmrxn_5_ode-ideal/library/copy.V/Out1');
  add_block('simulink/Ports & Subsystems/In1','ckt_smmrxn_5_ode-ideal/library/copy.V/X');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/copy.V/_X');
  add_line('ckt_smmrxn_5_ode-ideal/library/copy.V','X/1','_X/1');
  add_block('simulink/Ports & Subsystems/Out1','ckt_smmrxn_5_ode-ideal/library/copy.V/Y');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/copy.V/_Y');
  add_line('ckt_smmrxn_5_ode-ideal/library/copy.V','_Y/1','Y/1');
  %
  add_block('simulink/Ports & Subsystems/Subsystem','ckt_smmrxn_5_ode-ideal/library/vtoi');
  delete_line('ckt_smmrxn_5_ode-ideal/library/vtoi','In1/1','Out1/1');
  delete_block('ckt_smmrxn_5_ode-ideal/library/vtoi/In1');
  delete_block('ckt_smmrxn_5_ode-ideal/library/vtoi/Out1');
  add_block('simulink/Ports & Subsystems/In1','ckt_smmrxn_5_ode-ideal/library/vtoi/X');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/vtoi/_X');
  add_line('ckt_smmrxn_5_ode-ideal/library/vtoi','X/1','_X/1');
  add_block('simulink/Ports & Subsystems/In1','ckt_smmrxn_5_ode-ideal/library/vtoi/K');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/vtoi/_K');
  add_line('ckt_smmrxn_5_ode-ideal/library/vtoi','K/1','_K/1');
  add_block('simulink/Ports & Subsystems/Out1','ckt_smmrxn_5_ode-ideal/library/vtoi/Y');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/vtoi/_Y');
  add_line('ckt_smmrxn_5_ode-ideal/library/vtoi','_Y/1','Y/1');
  add_block('simulink/Sources/Constant','ckt_smmrxn_5_ode-ideal/library/vtoi/const_270');
  set_param('ckt_smmrxn_5_ode-ideal/library/vtoi/const_270','Value','1.');
  add_block('simulink/Math Operations/Product','ckt_smmrxn_5_ode-ideal/library/vtoi/div_272');
  set_param('ckt_smmrxn_5_ode-ideal/library/vtoi/div_272','Inputs','*/');
  add_line('ckt_smmrxn_5_ode-ideal/library/vtoi','const_270/1','div_272/1');
  add_line('ckt_smmrxn_5_ode-ideal/library/vtoi','_K/1','div_272/2');
  add_block('simulink/Math Operations/Product','ckt_smmrxn_5_ode-ideal/library/vtoi/mul_275');
  set_param('ckt_smmrxn_5_ode-ideal/library/vtoi/mul_275','Inputs','**');
  add_line('ckt_smmrxn_5_ode-ideal/library/vtoi','div_272/1','mul_275/1');
  add_line('ckt_smmrxn_5_ode-ideal/library/vtoi','_X/1','mul_275/2');
  %
  add_block('simulink/Ports & Subsystems/Subsystem','ckt_smmrxn_5_ode-ideal/library/vadd');
  delete_line('ckt_smmrxn_5_ode-ideal/library/vadd','In1/1','Out1/1');
  delete_block('ckt_smmrxn_5_ode-ideal/library/vadd/In1');
  delete_block('ckt_smmrxn_5_ode-ideal/library/vadd/Out1');
  add_block('simulink/Ports & Subsystems/In1','ckt_smmrxn_5_ode-ideal/library/vadd/OUT2_0');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/vadd/_OUT2_0');
  add_line('ckt_smmrxn_5_ode-ideal/library/vadd','OUT2_0/1','_OUT2_0/1');
  add_block('simulink/Ports & Subsystems/In1','ckt_smmrxn_5_ode-ideal/library/vadd/D');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/vadd/_D');
  add_line('ckt_smmrxn_5_ode-ideal/library/vadd','D/1','_D/1');
  add_block('simulink/Ports & Subsystems/In1','ckt_smmrxn_5_ode-ideal/library/vadd/C');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/vadd/_C');
  add_line('ckt_smmrxn_5_ode-ideal/library/vadd','C/1','_C/1');
  add_block('simulink/Ports & Subsystems/In1','ckt_smmrxn_5_ode-ideal/library/vadd/A');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/vadd/_A');
  add_line('ckt_smmrxn_5_ode-ideal/library/vadd','A/1','_A/1');
  add_block('simulink/Ports & Subsystems/In1','ckt_smmrxn_5_ode-ideal/library/vadd/B');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/vadd/_B');
  add_line('ckt_smmrxn_5_ode-ideal/library/vadd','B/1','_B/1');
  add_block('simulink/Ports & Subsystems/Out1','ckt_smmrxn_5_ode-ideal/library/vadd/OUT');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/vadd/_OUT');
  add_line('ckt_smmrxn_5_ode-ideal/library/vadd','_OUT/1','OUT/1');
  add_block('simulink/Ports & Subsystems/Out1','ckt_smmrxn_5_ode-ideal/library/vadd/OUT2');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/vadd/_OUT2');
  add_line('ckt_smmrxn_5_ode-ideal/library/vadd','_OUT2/1','OUT2/1');
  add_block('simulink/Math Operations/Sum','ckt_smmrxn_5_ode-ideal/library/vadd/sub_312');
  set_param('ckt_smmrxn_5_ode-ideal/library/vadd/sub_312','Inputs','++');
  add_line('ckt_smmrxn_5_ode-ideal/library/vadd','_A/1','sub_312/1');
  add_line('ckt_smmrxn_5_ode-ideal/library/vadd','_B/1','sub_312/2');
  add_block('simulink/Math Operations/Sum','ckt_smmrxn_5_ode-ideal/library/vadd/sum_315');
  set_param('ckt_smmrxn_5_ode-ideal/library/vadd/sum_315','Inputs','+--');
  add_line('ckt_smmrxn_5_ode-ideal/library/vadd','sub_312/1','sum_315/1');
  add_line('ckt_smmrxn_5_ode-ideal/library/vadd','_C/1','sum_315/2');
  add_line('ckt_smmrxn_5_ode-ideal/library/vadd','_D/1','sum_315/3');
  add_block('simulink/Sources/Constant','ckt_smmrxn_5_ode-ideal/library/vadd/const_319');
  set_param('ckt_smmrxn_5_ode-ideal/library/vadd/const_319','Value','0.1');
  add_block('simulink/Math Operations/Product','ckt_smmrxn_5_ode-ideal/library/vadd/mul_321');
  set_param('ckt_smmrxn_5_ode-ideal/library/vadd/mul_321','Inputs','**');
  add_line('ckt_smmrxn_5_ode-ideal/library/vadd','sum_315/1','mul_321/1');
  add_line('ckt_smmrxn_5_ode-ideal/library/vadd','const_319/1','mul_321/2');
  add_block('simulink/Math Operations/Sum','ckt_smmrxn_5_ode-ideal/library/vadd/sub_324');
  set_param('ckt_smmrxn_5_ode-ideal/library/vadd/sub_324','Inputs','++');
  add_line('ckt_smmrxn_5_ode-ideal/library/vadd','_A/1','sub_324/1');
  add_line('ckt_smmrxn_5_ode-ideal/library/vadd','_B/1','sub_324/2');
  add_block('simulink/Math Operations/Product','ckt_smmrxn_5_ode-ideal/library/vadd/mul_327');
  set_param('ckt_smmrxn_5_ode-ideal/library/vadd/mul_327','Inputs','**');
  add_line('ckt_smmrxn_5_ode-ideal/library/vadd','_D/1','mul_327/1');
  add_line('ckt_smmrxn_5_ode-ideal/library/vadd','_OUT2/1','mul_327/2');
  add_block('simulink/Math Operations/Sum','ckt_smmrxn_5_ode-ideal/library/vadd/sum_330');
  set_param('ckt_smmrxn_5_ode-ideal/library/vadd/sum_330','Inputs','+--');
  add_line('ckt_smmrxn_5_ode-ideal/library/vadd','sub_324/1','sum_330/1');
  add_line('ckt_smmrxn_5_ode-ideal/library/vadd','_C/1','sum_330/2');
  add_line('ckt_smmrxn_5_ode-ideal/library/vadd','mul_327/1','sum_330/3');
  add_block('simulink/Sources/Constant','ckt_smmrxn_5_ode-ideal/library/vadd/const_334');
  set_param('ckt_smmrxn_5_ode-ideal/library/vadd/const_334','Value','0.1');
  add_block('simulink/Math Operations/Product','ckt_smmrxn_5_ode-ideal/library/vadd/mul_336');
  set_param('ckt_smmrxn_5_ode-ideal/library/vadd/mul_336','Inputs','**');
  add_line('ckt_smmrxn_5_ode-ideal/library/vadd','sum_330/1','mul_336/1');
  add_line('ckt_smmrxn_5_ode-ideal/library/vadd','const_334/1','mul_336/2');
  add_block('simulink/Continuous/Integrator','ckt_smmrxn_5_ode-ideal/library/vadd/int_339');
  add_line('ckt_smmrxn_5_ode-ideal/library/vadd','mul_336/1','int_339/1');
  add_line('ckt_smmrxn_5_ode-ideal/library/vadd','int_339/1','_OUT2/1');
  %
  add_block('simulink/Ports & Subsystems/Subsystem','ckt_smmrxn_5_ode-ideal/library/copy.I');
  delete_line('ckt_smmrxn_5_ode-ideal/library/copy.I','In1/1','Out1/1');
  delete_block('ckt_smmrxn_5_ode-ideal/library/copy.I/In1');
  delete_block('ckt_smmrxn_5_ode-ideal/library/copy.I/Out1');
  add_block('simulink/Ports & Subsystems/In1','ckt_smmrxn_5_ode-ideal/library/copy.I/X');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/copy.I/_X');
  add_line('ckt_smmrxn_5_ode-ideal/library/copy.I','X/1','_X/1');
  add_block('simulink/Ports & Subsystems/Out1','ckt_smmrxn_5_ode-ideal/library/copy.I/Y');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/copy.I/_Y');
  add_line('ckt_smmrxn_5_ode-ideal/library/copy.I','_Y/1','Y/1');
  %
  add_block('simulink/Ports & Subsystems/Subsystem','ckt_smmrxn_5_ode-ideal/library/iadd');
  delete_line('ckt_smmrxn_5_ode-ideal/library/iadd','In1/1','Out1/1');
  delete_block('ckt_smmrxn_5_ode-ideal/library/iadd/In1');
  delete_block('ckt_smmrxn_5_ode-ideal/library/iadd/Out1');
  add_block('simulink/Ports & Subsystems/In1','ckt_smmrxn_5_ode-ideal/library/iadd/D');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/iadd/_D');
  add_line('ckt_smmrxn_5_ode-ideal/library/iadd','D/1','_D/1');
  add_block('simulink/Ports & Subsystems/In1','ckt_smmrxn_5_ode-ideal/library/iadd/C');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/iadd/_C');
  add_line('ckt_smmrxn_5_ode-ideal/library/iadd','C/1','_C/1');
  add_block('simulink/Ports & Subsystems/In1','ckt_smmrxn_5_ode-ideal/library/iadd/A');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/iadd/_A');
  add_line('ckt_smmrxn_5_ode-ideal/library/iadd','A/1','_A/1');
  add_block('simulink/Ports & Subsystems/In1','ckt_smmrxn_5_ode-ideal/library/iadd/B');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/iadd/_B');
  add_line('ckt_smmrxn_5_ode-ideal/library/iadd','B/1','_B/1');
  add_block('simulink/Ports & Subsystems/Out1','ckt_smmrxn_5_ode-ideal/library/iadd/OUT');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/iadd/_OUT');
  add_line('ckt_smmrxn_5_ode-ideal/library/iadd','_OUT/1','OUT/1');
  add_block('simulink/Math Operations/Sum','ckt_smmrxn_5_ode-ideal/library/iadd/sub_376');
  set_param('ckt_smmrxn_5_ode-ideal/library/iadd/sub_376','Inputs','++');
  add_line('ckt_smmrxn_5_ode-ideal/library/iadd','_A/1','sub_376/1');
  add_line('ckt_smmrxn_5_ode-ideal/library/iadd','_B/1','sub_376/2');
  add_block('simulink/Math Operations/Sum','ckt_smmrxn_5_ode-ideal/library/iadd/sum_379');
  set_param('ckt_smmrxn_5_ode-ideal/library/iadd/sum_379','Inputs','+--');
  add_line('ckt_smmrxn_5_ode-ideal/library/iadd','sub_376/1','sum_379/1');
  add_line('ckt_smmrxn_5_ode-ideal/library/iadd','_C/1','sum_379/2');
  add_line('ckt_smmrxn_5_ode-ideal/library/iadd','_D/1','sum_379/3');
  %
  add_block('simulink/Ports & Subsystems/Subsystem','ckt_smmrxn_5_ode-ideal/library/input.I');
  delete_line('ckt_smmrxn_5_ode-ideal/library/input.I','In1/1','Out1/1');
  delete_block('ckt_smmrxn_5_ode-ideal/library/input.I/In1');
  delete_block('ckt_smmrxn_5_ode-ideal/library/input.I/Out1');
  add_block('simulink/Ports & Subsystems/In1','ckt_smmrxn_5_ode-ideal/library/input.I/X');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/input.I/_X');
  add_block('simulink/Discontinuities/Quantizer','ckt_smmrxn_5_ode-ideal/library/input.I/smp_389');
  set_param('ckt_smmrxn_5_ode-ideal/library/input.I/smp_389','Interval','1e-05');
  add_line('ckt_smmrxn_5_ode-ideal/library/input.I','X/1','smp_389/1');
  add_line('ckt_smmrxn_5_ode-ideal/library/input.I','smp_389/1','_X/1');
  add_block('simulink/Ports & Subsystems/Out1','ckt_smmrxn_5_ode-ideal/library/input.I/O');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/input.I/_O');
  add_line('ckt_smmrxn_5_ode-ideal/library/input.I','_O/1','O/1');
  %
  add_block('simulink/Ports & Subsystems/Subsystem','ckt_smmrxn_5_ode-ideal/library/igenebind');
  delete_line('ckt_smmrxn_5_ode-ideal/library/igenebind','In1/1','Out1/1');
  delete_block('ckt_smmrxn_5_ode-ideal/library/igenebind/In1');
  delete_block('ckt_smmrxn_5_ode-ideal/library/igenebind/Out1');
  add_block('simulink/Ports & Subsystems/In1','ckt_smmrxn_5_ode-ideal/library/igenebind/TF');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/igenebind/_TF');
  add_line('ckt_smmrxn_5_ode-ideal/library/igenebind','TF/1','_TF/1');
  add_block('simulink/Ports & Subsystems/In1','ckt_smmrxn_5_ode-ideal/library/igenebind/K');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/igenebind/_K');
  add_line('ckt_smmrxn_5_ode-ideal/library/igenebind','K/1','_K/1');
  add_block('simulink/Ports & Subsystems/In1','ckt_smmrxn_5_ode-ideal/library/igenebind/Vmax');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/igenebind/_Vmax');
  add_line('ckt_smmrxn_5_ode-ideal/library/igenebind','Vmax/1','_Vmax/1');
  add_block('simulink/Ports & Subsystems/Out1','ckt_smmrxn_5_ode-ideal/library/igenebind/GE');
  add_block('simulink/Math Operations/Gain','ckt_smmrxn_5_ode-ideal/library/igenebind/_GE');
  add_line('ckt_smmrxn_5_ode-ideal/library/igenebind','_GE/1','GE/1');
  add_block('simulink/Sources/Constant','ckt_smmrxn_5_ode-ideal/library/igenebind/const_415');
  set_param('ckt_smmrxn_5_ode-ideal/library/igenebind/const_415','Value','1.');
  add_block('simulink/Sources/Constant','ckt_smmrxn_5_ode-ideal/library/igenebind/const_417');
  set_param('ckt_smmrxn_5_ode-ideal/library/igenebind/const_417','Value','1.');
  add_block('simulink/Math Operations/Product','ckt_smmrxn_5_ode-ideal/library/igenebind/mul_419');
  set_param('ckt_smmrxn_5_ode-ideal/library/igenebind/mul_419','Inputs','**');
  add_line('ckt_smmrxn_5_ode-ideal/library/igenebind','_K/1','mul_419/1');
  add_line('ckt_smmrxn_5_ode-ideal/library/igenebind','_TF/1','mul_419/2');
  add_block('simulink/Math Operations/Sum','ckt_smmrxn_5_ode-ideal/library/igenebind/sub_422');
  set_param('ckt_smmrxn_5_ode-ideal/library/igenebind/sub_422','Inputs','++');
  add_line('ckt_smmrxn_5_ode-ideal/library/igenebind','const_417/1','sub_422/1');
  add_line('ckt_smmrxn_5_ode-ideal/library/igenebind','mul_419/1','sub_422/2');
  add_block('simulink/Math Operations/Product','ckt_smmrxn_5_ode-ideal/library/igenebind/div_425');
  set_param('ckt_smmrxn_5_ode-ideal/library/igenebind/div_425','Inputs','*/');
  add_line('ckt_smmrxn_5_ode-ideal/library/igenebind','const_415/1','div_425/1');
  add_line('ckt_smmrxn_5_ode-ideal/library/igenebind','sub_422/1','div_425/2');
  add_block('simulink/Math Operations/Product','ckt_smmrxn_5_ode-ideal/library/igenebind/mul_428');
  set_param('ckt_smmrxn_5_ode-ideal/library/igenebind/mul_428','Inputs','**');
  add_line('ckt_smmrxn_5_ode-ideal/library/igenebind','_Vmax/1','mul_428/1');
  add_line('ckt_smmrxn_5_ode-ideal/library/igenebind','div_425/1','mul_428/2');
end
%
%
%
