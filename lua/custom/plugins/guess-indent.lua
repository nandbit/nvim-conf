-- Indentation style detection
-- Whenever you open a new buffer, guess-indent looks at the first few hundred lines
-- and uses them to determine how the buffer should be indented. It then automatically
-- updates the buffer options so that they match the opened file.

return { 'NMAC427/guess-indent.nvim', opts = {} }
