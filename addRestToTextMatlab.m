% Check if file already has a rest condition at the starting
%set up currently in order (timeFrame, trigger, ?duration?)
%% DEPENDENCY ON rdir, find_and_replace
function addRest()
  disp('Rest is being added to ONLY this matlab instance')
  %Set path to folder on your current computer
  curDir = cd;
  fPath =  '/Users/erikarnold/Downloads';
%   end
  restTrig = [1 0 1 1 0 0 0 0 0];
  %finds all the .evt file locations
  evtFilePath = rdir(fullfile(fPath,'*/','**/','*/','*.evt'));
  %Only keeps the path to the evt files
  evtFilePath = {evtFilePath(:).name};
  %cycle through the EVT files checking for rest conditions
  for n = 1:length(evtFilePath)
    disp(n)
    disp(length(evtFilePath))
    curEVT = load(char(evtFilePath(n)));
    oGEVT = load(char(evtFilePath(n)));
    disp(char(evtFilePath(n)))
%     timeIdx = curEVT(:,1);
    %get the first binary event code
    fstEVT = curEVT(1,:);
    %1 is the time Frame
    fstEVT = strcat(num2str(fstEVT(2)),num2str(fstEVT(3)),num2str(fstEVT(4)),num2str(fstEVT(5)));
    %if there is no rest event at the begining
    if strcmp(fstEVT,'0110')
      disp ('there is a rest')
    else
      %print the output to a text file with the rest condition first (CURRENTLY STARTING AT 0)
      disp('There is no rest')
      % this code adds the 1 to the duration before the 
      vertcat(1,rawEdited(n, 1).stimulus.values{n, 5}.onset);
      %Get duration from first item loaded in, and vercat that to next one
      dur = rawEdited(n, 1).stimulus.values{n, 5}.dur(1);
      vertcat(dur,rawEdited(n, 1).stimulus.values{n, 5}.dur);
      %add to the amp 
      vertcat(1,rawEdited(n, 1).stimulus.values{n, 5}.amp);
    end

  end
