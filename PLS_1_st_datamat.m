function PLS_1_st_datamat( varargin )
%create subject specific st_datamat batch files for PLS
%   Detailed explanation goes here
%
% Input: 1. Subject ID list
%        2. Template batch file
%        3. Functional image directory
%        4. Save directory (optinal)
%           - If not set, files are saved to current working directory 
%
% Output: st_datamat ID specific
%
% takes template creates ID specific datamat file, seperate TASK-REST, RUN
  


%% Test input and set paths
if nargin == 0;
    error ('Input: arguments missing')
elseif nargin < 3
    error ('Input: ID list, template file path or Nifti path is missing')
elseif nargin == 3
    subjID = varargin{1};
    BATCHFILE = varargin{2};
    NIIPATH = varargin{3};
    SAVEPATH = pwd;
else
    subjID = varargin{1};
    BATCHFILE = varargin{2};    
    NIIPATH = varargin{3}; 
    SAVEPATH = varargin{4};
end


if exist(BATCHFILE,'file') ~= 2
    error ('template file path incorrect')
else template = load (BATCHFILE);
end

if exist(NIIPATH,'dir') ~= 7
    error ('"NIIPATH" incorrect')
elseif exist(SAVEPATH,'dir') ~= 7
    error ('"SAVEPATH" incorrect')   
end


%% batch file creation

for i = 1:numel(subjID)

batch_files{i}.prefix=[template.batch_file.prefix, '_' ,subjID{i}];

% data_files
fprintf ('\nSetting data_files: \n')
%batch_file.data_files{1,batch_file.datamat_creation.runs} = {};

for j = 1: numel(template.batch_file.data_files)

     [NIIpathname,NIIfilename, ext] = fileparts(template.batch_file.data_files{1,j});    
     % test if data_files possess correct nameing
     if ~isempty (regexpi (NIIpathname, 'ID'))
         NIIpathnameNEW = strrep(NIIpathname, 'ID', subjID{i});                     % replace wildcard 'ID' with subjID in PATH
     %else fprintf ('no ID in template Nifti path (batch_file.data_files)\n')
     end
     
     if ~isempty(regexpi (NIIpathname, 'RUN'))
         NIIpathnameNEW = strrep(NIIpathnameNEW, 'RUN', ['run', num2str(j)]);         % replace wildcard 'RUN' with run in PATH       
     %else fprintf ('no RUN in template Nifti path (batch_file.data_files)\n')
     end
     
     if ~isempty(regexpi (NIIfilename, 'ID'))
         NIIfilenameNEW = strrep(NIIfilename, 'ID', subjID{i});                       % replace wildcard 'ID' with subjID in NAME
     else error ('template (batch_file.data_files): nifit filename must contain "ID"');
     end
     
     if ~isempty(regexpi (NIIfilename, 'RUN'))
         NIIfilenameNEW = strrep(NIIfilenameNEW, 'RUN', ['RUN', num2str(j)]);         % replace wildcard 'RUN' with run in NAME
     %elseif fprintf ('no RUN in template Nifti filename (batch_file.data_files)\n')
     end
     
     if ~isempty(regexpi (NIIfilename, 'run'))
         NIIfilenameNEW = strrep(NIIfilenameNEW, 'run', ['run', num2str(j)]);         % replace wildcard 'RUN' with run in NAME
     %elseif fprintf ('no run in template Nifti filename (batch_file.data_files)\n')
     end

    batch_files{i}.data_files{1,j} = strcat(NIIPATH, '/',NIIfilenameNEW, ext);       % write new path and new filename
    
    fprintf ([(strcat(NIIpathname, '/',NIIfilename)) ' --> ', batch_files{i}.data_files{1,j}, '\n'])    

end



%% save

[~ , BATCHfilename, ext] = fileparts(BATCHFILE);
 
if findstr (BATCHfilename, 'template')
   BATCHfilename = strrep(BATCHfilename, 'template', subjID{i});         % replace wildcard 'template' with subjID in template filename
else error ('template not in template batch file name')
end


fprintf (['save as:\n', SAVEPATH, '/', BATCHfilename, ext '\n'])
save ([SAVEPATH, '/', BATCHfilename], 'batch_file');


end
end

