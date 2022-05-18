"" Terminal
nnoremap <c-t> :action ActivateTerminalToolWindow<CR>
nnoremap <leader>t :action Terminal.OpenInTerminal<CR>

" Navigation
map <C-e> :action RecentFiles<CR>
nnoremap <leader>ff :action GotoFile<CR>
nnoremap <leader>fg :action FindInPath<CR>
vnoremap <leader>fg :action FindInPath<CR>
nnoremap <leader>fb :action RecentFiles<CR>
nnoremap <leader>fu :action FindUsages<CR>

nnoremap <leader>gd :action GotoDeclaration<CR>
nnoremap <leader>ge :action JumpToLastChange<CR>
nnoremap <leader>gb :action Back<CR>
nnoremap <leader>gf :action Forward<CR>
nnoremap <leader>gs :action FileStructurePopup<CR>
nnoremap <leader>gu :action FindUsagesMenuGroup<CR>

nnoremap <leader>uf :action FindUsagesInFile<CR>
nnoremap <leader>; :action GotoNextElementUnderCaretUsage<CR>
nnoremap <leader>, :action GotoPrevElementUnderCaretUsage<CR>

nnoremap <leader>k :action PreviousOccurence<CR>
nnoremap <leader>j :action NextOccurence<CR>

"" Window management
nnoremap <Leader>ww :action MoveEditorToOppositeTabGroup<CR>

" Editing
nnoremap <leader>r :action Refactorings.QuickListPopupAction<CR>
nnoremap <leader>it :action InsertLiveTemplate<CR>
inoremap <A-j> <C-o>:action InsertLiveTemplate<CR>
nnoremap <leader>is :action SurroundWithLiveTemplate<CR>

" Run/Debug
map <leader>,r :action ContextRun<CR>
map <leader>,d :action ContextDebug<CR>
map <leader>,u :action Run<CR>
map <leader>,t :action ActivateRunToolWindows<CR>

" VCS
nnoremap <leader>vd :action Compare.SameVersion<CR>
nnoremap <leader>vb :action Git.CompareWithBranch<CR>
nnoremap <leader>vl :action Vcs.Show.Log<CR>
nnoremap <leader>vf :action Vcs.ShowTabbedFileHistory<CR>
nnoremap <leader>va :action Annotate<CR>
nnoremap <leader>vc :action ActivateCommitToolWindow<CR>
nnoremap <leader>vu :action Vcs.UpdateProject<CR>

