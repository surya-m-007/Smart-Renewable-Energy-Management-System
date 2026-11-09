Smart Renewable Energy Management System with Adaptive Load Shedding
Group 14, 23EEE335 Renewable Energy Technologies, Amrita School of Engineering, Coimbatore

NEEDS: MATLAB R2025a with Simulink, Simscape Electrical (Specialized Power Systems) and Stateflow.

HOW TO RUN
 1. Unzip anywhere (keep all files in this one folder).
 2. Open MATLAB R2025a, go to this folder.
 3. Type in the Command Window:   RUN_ALL
 4. Wait (roughly 30-60 min in total). All images are saved in  results\figures\

 Run one part only:  RUN_ALL('pv')   RUN_ALL('inverter')   RUN_ALL('grid')   RUN_ALL('figures')
 (make_figures draws only the figures whose results already exist.)

FILES
 microgrid_top_fixed.slx  main model: PV 38.4 kW, battery 240 V/130 kWh, supercap, 400 V DC bus, load manager (12 flats)
 PV_Unit_day.slx          one 19.2 kW PV unit with MPPT (Test 1)
 CHB_inverter_v2.slx      5-level CHB inverter (Test 2; build_chb_inverter re-creates it)
 init_microgrid.m         all parameters (runs automatically when the main model starts)
 pv_daily_profile.csv/.mat  NASA POWER weather, Coimbatore: clear 9 May 2025, partly cloudy 16 May 2025
 run_test1_pv.m, ppt_plots_pv.m, build_chb_inverter.m, plot_test4.m, make_figures.m   test + plot scripts
 RUN_ALL.m                runs everything

NOTES
 - Time is compressed: 1 real hour = 0.12 s in the main model (24 h = 2.88 s), 0.05 s in the PV model.
 - To run the main model by hand:  DAY = 'cloudy';  out = sim('microgrid_top_fixed');  plot_test4(out,'cloudy_24h')
 - Do not open the image files while a script is saving them (Windows locks them and saving fails).
 - The .slxc / slprj cache files are created by MATLAB on your laptop; they are not needed in the zip.
