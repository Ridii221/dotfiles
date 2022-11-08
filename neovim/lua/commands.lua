local A = vim.api

function CD()
   vim.cmd('cd %:p:h');
end
A.nvim_create_user_command('CD', CD, {})
