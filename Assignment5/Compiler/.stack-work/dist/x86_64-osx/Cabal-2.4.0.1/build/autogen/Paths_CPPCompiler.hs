{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_CPPCompiler (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/Sam_comp/Documents/Assignment5/Compiler/.stack-work/install/x86_64-osx/b93b14cc6824655921da6042afc2a399ad9077d3bbf7e0530ef3f33ffeb84475/8.6.4/bin"
libdir     = "/Users/Sam_comp/Documents/Assignment5/Compiler/.stack-work/install/x86_64-osx/b93b14cc6824655921da6042afc2a399ad9077d3bbf7e0530ef3f33ffeb84475/8.6.4/lib/x86_64-osx-ghc-8.6.4/CPPCompiler-0.1.0.0-DplpX4Wrb1M2e5SmkUIF3M"
dynlibdir  = "/Users/Sam_comp/Documents/Assignment5/Compiler/.stack-work/install/x86_64-osx/b93b14cc6824655921da6042afc2a399ad9077d3bbf7e0530ef3f33ffeb84475/8.6.4/lib/x86_64-osx-ghc-8.6.4"
datadir    = "/Users/Sam_comp/Documents/Assignment5/Compiler/.stack-work/install/x86_64-osx/b93b14cc6824655921da6042afc2a399ad9077d3bbf7e0530ef3f33ffeb84475/8.6.4/share/x86_64-osx-ghc-8.6.4/CPPCompiler-0.1.0.0"
libexecdir = "/Users/Sam_comp/Documents/Assignment5/Compiler/.stack-work/install/x86_64-osx/b93b14cc6824655921da6042afc2a399ad9077d3bbf7e0530ef3f33ffeb84475/8.6.4/libexec/x86_64-osx-ghc-8.6.4/CPPCompiler-0.1.0.0"
sysconfdir = "/Users/Sam_comp/Documents/Assignment5/Compiler/.stack-work/install/x86_64-osx/b93b14cc6824655921da6042afc2a399ad9077d3bbf7e0530ef3f33ffeb84475/8.6.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "CPPCompiler_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "CPPCompiler_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "CPPCompiler_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "CPPCompiler_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "CPPCompiler_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "CPPCompiler_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
