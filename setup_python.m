% % setup_python.m

% create pip folder if it doesn't exist
if ~exist('pip', 'dir')
    mkdir('pip');
    
    % retrieve pip files
    files = ["getwheel","setuppip","pipinstall","piplist","pipcmd","pipshow","pipuninstall"];
    BASE_URL = "https://raw.githubusercontent.com/yanndebray/matlab-with-python-book/main/code/";
    for i = 1:length(files)
    url = BASE_URL+files{i}+".m";
    websave("pip/"+files{i}+".m",url);
    end
end

addpath("pip/")

% install sunpy package
pipinstall("numpy opencv-python")