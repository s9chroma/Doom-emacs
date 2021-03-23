;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Pavan"
      user-mail-address "s9chroma@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Fira Code" :size 18 :weight 'Medium)
       doom-variable-pitch-font (font-spec :family "sans" :size 18))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-homage-black)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq-default evil-escape-key-sequence "jj")
(setq-default evil-escape-delay 0.2)

(add-hook 'before-save-hook #'+format|buffer)
(after! format
 (set-formatter! 'clang-format
   '("clang-format"
     "-style={
                BasedOnStyle: LLVM,
                IndentWidth: 4,
                SortIncludes: false,
                AlwaysBreakAfterDefinitionReturnType: All,
                AlwaysBreakTemplateDeclarations: Yes,
                SpacesBeforeTrailingComments: 4,
                SpaceAfterCStyleCast: true,
                NamespaceIndentation: All,
                BreakBeforeBraces: Allman,
                AlwaysBreakAfterReturnType: All,
                AllowShortLoopsOnASingleLine: true,
                AllowShortIfStatementsOnASingleLine: Always,
                AllowShortCaseLabelsOnASingleLine: true,
                AlignTrailingComments: true,
                SpaceBeforeParens: Never,
             }"
     ("-assume-filename=%S" (or buffer-file-name mode-result "")))
   )
 )

(map! "M-l" #'evil-window-right)
(map! "M-h" #'evil-window-left)
(map! "M-L" #'evil-window-move-far-right)
(map! "M-H" #'evil-window-move-far-left)
(map! "M-v" #'+evil/window-vsplit-and-follow)
(map! "M-k" #'kill-current-buffer)
(map! "M-d" #'kill-buffer-and-window)

(map! "C-l" #'evil-forward-char)
(map! "C-h" #'evil-backward-char)
