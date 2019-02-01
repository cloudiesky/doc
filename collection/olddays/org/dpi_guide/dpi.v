program automatic ci_verify(input reg clk);
   import "DPI-C" function void ci_rm_wrapper
     (
      input shortint   PBMod,
      input shortint   FECMod,
      input shortint   StepSize,
      input shortint   Offset,
      input shortint   Col_Rotate_Mod,
      input shortint   Shift,
      input bit [15:0] sv_ci_din[],
      input bit [15:0] sv_ci_dou[],
      input bit [15:0] sv_cdi_din[],
      input bit [15:0] sv_cdi_dou[]
      );

   //.......

   task task_ci_sim_item;
      //...............
      ci_rm_wrapper(
                    ci_param_u.PBMod,
                    ci_param_u.FECMod,
                    ci_param_u.StepSize,
                    ci_param_u.Offset,
                    ci_param_u.Col_Rotate_Mod,
                    ci_param_u.Shift,
                    ci_seq_item_u.ci_din,
                    ci_seq_item_u.ci_dou,
                    ci_seq_item_u.cdi_din,
                    ci_seq_item_u.cdi_dou
                    );

      //............

   endtask

   initial begin

      //..........

      task_ci_sim_item();

      //...........

   end
endprogram
