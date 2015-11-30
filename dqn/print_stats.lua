require 'initenv'
require 'cunn'

local cmd = torch.CmdLine()
cmd:text()
cmd:text('print statistics from .t7 file')
cmd:text()
cmd:option('-network', '', 'path to saved .t7 network and training history file. e.g: DQN3_0_1_breakout_FULL_Y.t7')
cmd:option('-csv', '', 'path to output .csv file')
cmd:text()
local opt = cmd:parse(arg)

local model = torch.load(opt.network)

-- Opens a file in append mode
file = io.open(opt.csv, "w")
-- sets the default output file as test.lua
io.output(file)


io.write('reward_history\n')
for i=1,#model.reward_history do
	io.write(string.format('%d %f\n',i,model.reward_history[i]))
end

io.write('v_history\n')
for i=1,#model.v_history do
	io.write(string.format('%d %f\n',i,model.v_history[i]))end

io.write('td_history\n')
for i=1,#model.td_history do
	io.write(string.format('%d %f\n',i,model.td_history[i]))
end

-- closes the open file
io.close(file)

