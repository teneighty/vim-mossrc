" Vim syntax file
" Language:	mossrc
" Author:	Tim Horton <tmhorton@gmail.com>
" Copyright:	Copyright (c) 2011 Tim Horton
" Licence:	You may redistribute this under the same terms as Vim itself

if exists("b:current_syntax")
  finish
endif

syn region MossrcComment start=/^#/ end=/$/
syn keyword MossrcSetting 
  \color_add alignment background_color background_image background_mod default_color 
  \default_outline_color default_shade_color uppercase disable_auto_reload 
  \font gap_x gap_y update_interval

syn keyword MossrcConstant yes no top_left top_middle top_right bottom_left bottom_middle bottom_right none

syn match MossrcNumber /\S\@<!\d\+\(\.\d\+\)\?\(\S\@!\|}\@=\)/
      \ nextgroup=MossrcNumber,MossrcColour skipwhite
syn match MossrcColour /\S\@<!#[a-fA-F0-9]\{6\}\(\S\@!\|}\@=\)/
      \ nextgroup=MossrcNumber,MossrcColour skipwhite

syn region MossrcText start=/^TEXT$/ end=/\%$/ contains=MossrcVar

syn region MossrcVar start=/\${/ end=/}/ contained contains=MossrcVar,MossrcVarStuff,MossrcVarString
syn region MossrcVar start=/\$\w\@=/ end=/\W\@=\|$/ contained contains=MossrcVarName
syn region MossrcVarString start=/"/ end=/"/ contained
syn match MossrcVarStuff /{\@<=/ms=s contained nextgroup=MossrcVarName
syn keyword MossrcVarName contained nextgroup=MossrcNumber,MossrcColour skipwhite
    \alignc alignr battery battery_bar battery_percent color cpu cpubar cpugraph 
    \downspeed downspeedgraph font freq fs_bar fs_free fs_size fs_used fs_used_perc 
    \goto hr image interval kernel length loadavg machine mem membar memmax 
    \memperc nodename offset printf processes realtime running_processes stippled_hr 
    \swap swapbar swapmax swapperc sysname tcp_portmon time top top_mem totaldown 
    \totalup upspeed upspeedgraph uptime vgoto voffset

hi def link MossrcComment   Comment
hi def link MossrcSetting   Keyword
hi def link MossrcConstant  Constant
hi def link MossrcNumber    Number
hi def link MossrcColour    Special
hi def link MossrcVarString String

hi def link MossrcText      String
hi def link MossrcVar       Identifier
hi def link MossrcVarName   Keyword

let b:current_syntax = "mossrc"

