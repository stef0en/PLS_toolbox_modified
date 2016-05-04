function percent = parfor_progress(R,N)
%PARFOR_PROGRESS Progress monitor (progress bar) that works with parfor.
%   PARFOR_PROGRESS works by creating a file called parfor_progress.txt in
%   your working directory, and then keeping track of the parfor loop's
%   progress within that file. This workaround is necessary because parfor
%   workers cannot communicate with one another so there is no simple way
%   to know which iterations have finished and which haven't.
%
%   PARFOR_PROGRESS(R,N) initializes the progress monitor (identified with
%   a R = string) for a set of N upcoming calculations.
%
%   PARFOR_PROGRESS(R) updates the progress inside your parfor loop and
%   displays an updated progress bar.
%
%   PARFOR_PROGRESS(0) deletes parfor_progress.txt and finalizes progress
%   bar.
%
%   R = random string to identify parfor_process. If more parallel runs in
%   same folder
%
%   To suppress output from any of these functions, just ask for a return
%   variable from the function calls, like PERCENT = PARFOR_PROGRESS which
%   returns the percentage of completion.
%
%   Example:
%
%      N = 100;
%      parfor_progress(R,N);
%      parfor i=1:N
%         pause(rand); % Replace with real code
%         parfor_progress(R);
%      end
%      parfor_progress(R,0);
%
%   See also PARFOR.

% By Jeremy Scheff - jdscheff@gmail.com - http://www.jeremyscheff.com/

error(nargchk(1, 2, nargin, 'struct'));

if (nargin < 2)
    N = -1;
end

percent = 0;
w = 50; % Width of progress bar
 
if N > 0
    f = fopen(['parfor_progress_', R, '.txt'], 'w');
    if f<0
        error('Do you have write permissions for %s?', pwd);
    end
    fprintf(f, '%d\n', N); % Save N at the top of progress.txt
    fclose(f);
    
    if nargout == 0
        disp(['  0%[>', repmat(' ', 1, w), ']']);
    end
elseif N == 0
    delete(['parfor_progress_', R, '.txt']);
    percent = 100;
    
    if nargout == 0
        disp([repmat(char(8), 1, (w+9)), char(10), '100%[', repmat('=', 1, w+1), ']']);
    end
else
    if ~exist(['parfor_progress_', R, '.txt'], 'file')
        error(['parfor_progress_', R, '.txt not found. Run PARFOR_PROGRESS(N) before PARFOR_PROGRESS to initialize parfor_progress.txt.']);
    end
    
    f = fopen(['parfor_progress_', R, '.txt'], 'a');
    fprintf(f, '1\n');
    fclose(f);
    
    f = fopen(['parfor_progress_', R, '.txt'], 'r');
    progress = fscanf(f, '%d');
    fclose(f);
    percent = (length(progress)-1)/progress(1)*100;
    
    if nargout == 0
        perc = sprintf('%3.0f%%', percent); % 4 characters wide, percentage
        disp([repmat(char(8), 1, (w+9)), char(10), perc, '[', repmat('=', 1, round(percent*w/100)), '>', repmat(' ', 1, w - round(percent*w/100)), ']']);
    end
end
