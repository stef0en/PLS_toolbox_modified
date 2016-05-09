function PLS_1_st_datamat( varargin )
%create subject specific st_datamat batch files for PLS
%   Detailed explanation goes here
%
% Input: 1. Subject ID list
%        2. Template batch file
%        3. Functional image location (optinal)
%        4. Save directory (optinal)
  


%% Test input and set paths
if nargin == 0;
    error ('Input: arguments missing')
elseif nargin == 1
    error ('Input: ID list or template file path missing')
elseif nargin == 2
    subjID = varargin{1};
    BATCHFILE = varargin{2};    
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
else load (BATCHFILE)
end

if exist('NIIPATH','var') ~= 1
    NIIPATH=batch_file.datamat_creation.NIIPATH;
end

if exist('SAVEPATH','var') ~= 1
    SAVEPATH=batch_file.datamat_creation.SAVEPATH;
end

if exist(NIIPATH,'dir') ~= 7
    error ('"NIIPATH" incorrect')
elseif exist(SAVEPATH,'dir') ~= 7
    error ('"SAVEPATH" incorrect')   
end


%% batch file creation

for i = 1:numel(subjID)

batch_file.prefix=[batch_file.prefix, '_' ,subjID{i}];

% data_files
fprintf ('\nAltering data_files: \n')
%batch_file.data_files{1,batch_file.datamat_creation.runs} = {};

for j = 1: batch_file.datamat_creation.runs

    [NIIpathname,NIIfilename, ext] = fileparts(batch_file.data_files{1,j});    
%     % test if data_files possess correct nameing
%     if isempty(findstr (NIIpathname, 'ID'))
%         error ('template (batch_file.data_files): nifit path must contain wildcard "ID"')
%     elseif isempty(findstr (NIIpathname, 'RUN'))
%         error ('template (batch_file.data_files): nifit path must contain wildcard "RUN"')
%     elseif isempty(findstr (NIIfilename, 'ID'))
%         error ('template (batch_file.data_files): nifit filename must contain wildcard "ID"')
%     elseif isempty(findstr (NIIfilename, 'RUN'))
%         error ('template (batch_file.data_files): nifit filename must contain wildcard "RUN"')
%     end
        
    NIIpathnameNEW = strrep(NIIpathname, 'ID', subjID{i});                       % replace wildcard 'ID' with subjID in PATH
    NIIpathnameNEW = strrep(NIIpathnameNEW, 'RUN', ['run', num2str(j)]);         % replace wildcard 'RUN' with run in PATH       
    NIIfilenameNEW = strrep(NIIfilename, 'ID', subjID{i});                       % replace wildcard 'ID' with subjID in NAME
    NIIfilenameNEW = strrep(NIIfilenameNEW, 'RUN', ['run', num2str(j)]);         % replace wildcard 'RUN' with run in NAME
    batch_file.data_files{1,j} = strcat(NIIPATH, '/',NIIfilenameNEW, ext);       % write new path and new filename
    
    fprintf ([(strcat(NIIpathname, '/',NIIfilename)) ' --> ', batch_file.data_files{1,j}, '\n'])    
end

%% save
[~ , BATCHfilename, ext] = fileparts(BATCHFILE);
 
if findstr (BATCHfilename, 'template')
   BATCHfilename = strrep(BATCHfilename, 'template', num2str(j));         % replace wildcard 'template' with subjID in template filename
else BATCHfilename = strcat(BATCHfilename, '_', subjID{i});
end


fprintf (['save as:\n', SAVEPATH, '/', BATCHfilename, ext '\n'])
save ([SAVEPATH, '/', BATCHfilename], 'batch_file');

end


