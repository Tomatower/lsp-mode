;;; lsp-openscad.el --- openscad Client settings         -*- lexical-binding: t; -*-

;; Copyright (C) 2021 Johannes Walcher

;; Author: Johannes Walcher
;; Keywords: openscad lsp

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; lsp-openscad client

;;; Code:

(require 'lsp-mode)

(defgroup lsp-openscad nil
  "LSP support for openscad as language client"
  :group 'lsp-mode
  :link '(url-link "https://github.com/openscad/openscad"))

(defcustom lsp-openscad-server-path
  "openscad"
  "Path to the openscad binary."
  :group 'lsp-openscad
  :risky t
  :type 'file)

(defun lsp-openscad-server-start-fun (port)
  `(,lsp-openscad-server-path
    "--lsp-listen",(number-to-string port)))

(defun lsp-openscad-server-connection ()
  (lsp-tcp-connection 'lsp-openscad-server-start-fun))

(lsp-register-client
 (make-lsp-client :new-connection (lsp-openscad-server-connection)
                  :major-modes '(SCAD/*l)
                  :priority -1
                  :server-id 'openscad))

(provide 'lsp-openscad)
;;; lsp-openscad.el ends here
