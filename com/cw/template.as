﻿package com.cw{		//[=-------------------------------------------------	// Imports	//[=-------------------------------------------------	import flash.display.MovieClip;/*	-=] my class template [=-	-=] language version ActionScript 3.0 [=-	-=] player version Flash 10.0 [=-	-=] author Christian Worley [=-	-=] created 03/2011 [=-*/	//[=-------------------------------------------------	// Constructor	//[=-------------------------------------------------	public class template {		//[=-------------------------------------------------		// Public Vars		//[=-------------------------------------------------		public var publicVar:String;				//[=-------------------------------------------------		// Private Vars		//[=-------------------------------------------------		private var privateVar:String;		//[=-------------------------------------------------		// Public Methods		//[=-------------------------------------------------		//-=] Method discription [=-\\		public function publicClassMethod () {			trace ('publicClassMethod');		}		//[=-------------------------------------------------		// Private Methods		//[=-------------------------------------------------		//-=] Method discription [=-\\		private function privateClassMethod () {			trace ('privateClassMethod');		}		//[=-------------------------------------------------		// Getter/Setters		//[=-------------------------------------------------		//the private class variable is _name.		public function get name():String {    		return _name;  		}		public function set name(value:String):void {    		_name = value;  		}	}}