function batch_plsgui(varargin)
%% start PLS analysis or PLS datamat file creation.
% hacked version: receive input from .mat file as structure not as text 
% file


   if nargin < 1
      error('Usage: batch_plsgui(batch_text_file_name(s))');
   end

   %% initalize PLS
   p = which('plsgui');
   [p f] = fileparts(p); [p f] = fileparts(p);
   cmdloc = fullfile(p, 'plscmd');
   addpath(cmdloc);

   %% loop over various input files
   for i = 1:nargin
      load(varargin{i});
            
      % test if analysis or datamat creation has to be started 
      if batch_file.is_analysis==true
         batch_pls_analysis(batch_file);
      else
          batch_create_datamat(batch_file);
      end
   end

   return;					% batch_plsgui

