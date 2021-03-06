function [standard_efield,grid_vec,electrode,electrode_patient,atlases,electrode_native] = load_files(dir_fastfield,dir_patient,Electrode_type)
% inputs:
% dir_fastfield : the path to the fastfield source code
% dir_patient: the path to the patietn folder where the ea_reconstruction
% file is kept
% Electrode_type : name of the electrode

% outputs:
% standard_efield: the standard electric field
% grid_vec : the grid vector where the standard efield is clacilated
% electrode : th estandard model of the electrode
% electrode_patient : the location of the patients electrode in mni space
% atlases: the atlas structure of the targets of intrest

    
time_tracker('Loading resources')

% the electrode model of the patient
load([dir_patient filesep 'ea_reconstruction.mat']);
electrode_patient=reco.mni;

% if isfield(reco.native,field)
%     electrode_native=reco.native;
% else
    electrode_native=[];
% end



% load the atlas
load([dir_fastfield filesep 'resources' filesep 'atlas_combined.mat']);

% load the standard grid and Efield
load([dir_fastfield filesep 'resources' filesep Electrode_type filesep 'standard_efield_' Electrode_type '.mat']);



% the elecstode model
load([dir_fastfield filesep 'resources'  filesep Electrode_type filesep Electrode_type '.mat']);


time_tracker('')

end


