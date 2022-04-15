"" from https://towardsdatascience.com/the-essential-ideavim-remaps-291d4cd3971b
nnoremap \e :e C:/Users/dawsonp/.ideavimrc<CR>
nnoremap \r :action IdeaVim.ReloadVimRc.reload<CR>

" Enable g; and g,
nnoremap g; :action JumpToLastChange<Enter>

nnoremap <c-z> :action ToggleDistractionFreeMode<CR>

"" Terminal
nnoremap <c-t> :action ActivateTerminalToolWindow<CR>
nnoremap <leader>t :action Terminal.OpenInTerminal<CR>

" Navigation
map <C-e> :action RecentFiles<CR>
" nnoremap <leader>gd :action GotoDeclaration<CR>
nnoremap <leader>ge :action JumpToLastChange<CR>
nnoremap <leader>gb :action Back<CR>
nnoremap <leader>gf :action Forward<CR>
nnoremap <leader>gs :action FileStructurePopup<CR>
nnoremap <leader>uf :action FindUsagesInFile<CR>
nnoremap <leader>un :action NextHighlightedUsage<CR>
nnoremap <leader>gu :action FindUsagesMenuGroup<CR>

"" Window navigation
nnoremap <Leader>en :action EditSourceInNewWindow<CR>
nnoremap <Leader>n :action NextWindow<CR>
nnoremap <Leader>q :action CloseContent<CR>
nnoremap <Leader>ww :action MoveEditorToOppositeTabGroup<CR>

" Editing
nnoremap <leader>c :action CommentByLineComment<CR>
nnoremap <leader>r :action Refactorings.QuickListPopupAction<CR>
nnoremap <leader>it :action InsertLiveTemplate<CR>
inoremap <A-j> <C-o>:action InsertLiveTemplate<CR>
nnoremap <leader>is :action SurroundWithLiveTemplate<CR>

" Run/Debug
map <leader>,r :action ContextRun<CR>
map <leader>,d :action ContextDebug<CR>
map <leader>,u :action Run<CR>
map <leader>,t :action ActivateRunToolWindows<CR>
map <leader>n @@

" VCS
nnoremap <leader>vd :action Compare.SameVersion<CR>
nnoremap <leader>vb :action Git.CompareWithBranch<CR>
nnoremap <leader>vl :action Vcs.Show.Log<CR>
nnoremap <leader>vf :action Vcs.ShowTabbedFileHistory<CR>
nnoremap <leader>va :action Annotate<CR>
nnoremap <leader>vc :action ActivateCommitToolWindow<CR>
nnoremap <leader>vu :action Vcs.UpdateProject<CR>

