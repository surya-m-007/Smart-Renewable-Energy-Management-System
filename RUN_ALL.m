function RUN_ALL(part)
%RUN_ALL  Group 14, 23EEE335 RET: Smart Renewable Energy Management System with Adaptive Load Shedding.
%   Runs every simulation and saves all result images. MATLAB R2025a + Simulink + Simscape Electrical + Stateflow.
%
%   RUN_ALL              -> everything (about 30-60 min, depends on the laptop)
%   RUN_ALL('pv')        -> Test 1: PV unit, clear + cloudy day (NASA POWER weather)
%   RUN_ALL('inverter')  -> Test 2: 5-level CHB inverter
%   RUN_ALL('grid')      -> Test 4: integrated 24 h microgrid, clear + cloudy day (the long one)
%   RUN_ALL('figures')   -> only redraw the final figures from results already saved
%
%   Images are saved in  results\figures\  (final PNG + PDF)  and in each test folder under results\.
if nargin < 1, part = 'all'; end
here = fileparts(mfilename('fullpath'));
cd(here); addpath(here);
t0 = tic;

if any(strcmp(part,{'all','pv'}))
    run_test1_pv('clear');  close all
    run_test1_pv('cloudy'); close all
end
if any(strcmp(part,{'all','inverter'}))
    build_chb_inverter; close all
end
if any(strcmp(part,{'all','grid'}))
    for d = {'clear','cloudy'}
        evalin('base','clear');                    % fresh workspace for each day
        assignin('base','DAY',d{1});               % read by init_microgrid (model InitFcn)
        fprintf('\nTest 4: integrated microgrid, %s day (24 h). This takes a while...\n', d{1});
        tic; out = sim('microgrid_top_fixed'); fprintf('Finished in %.0f s\n', toc);
        assignin('base','out',out);
        plot_test4(out, [d{1} '_24h']); close all
    end
end
if any(strcmp(part,{'all','figures','pv','inverter','grid'}))
    try
        make_figures; close all
    catch e
        warning('make_figures: %s (run the missing tests first)', e.message);
    end
end
fprintf('\nDone in %.1f min. Images: %s\n', toc(t0)/60, fullfile(here,'results','figures'));
end
