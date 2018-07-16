% Check if file already has a rest condition at the starting
%set up currently in order (timeFrame, trigger, ?duration?)
%% DEPENDENCY ON rdir
function addRest()
  %Set path to folder on your current computer
%   if isempty(fPath)
  fPath =  '/Users/user/Downloads/Summer Training';
%   end
  restTrig = [0 0 1 1 0 0 0 0 0];
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
      fstRest = sprintf('%s',restTrig);
%      curEVTfile = fopen(char(evtFilePath(n)),'w');
%      dlmwrite(char(curEVTfile),fstRest)
      %% KNOWN BUG, makes output into one HUGE number. This is not the format prefed by anyone and everyone
%      dlmwrite(char(curEVTfile),oGEVT,'-append',' ')
      comboEVT = array2table(vertcat(restTrig, oGEVT));
      disp(evtFilePath(n))
      curTableName = sprintf('eventfile%i.txt',n);
      writetable(comboEVT,curTableName)
      movefile(curTableName,char(evtFilePath(n)))
      %ALMOST THERE!!! making it a table adds the problem of it having
      %headings now... need to get rid of those
    end

  end

      %put in first rest code
    %% What was the timing we decided to add?
  %a = sprintf('%d %d %d', 0)
    %fprintf the rest we desided on, then the rest of the file after.
