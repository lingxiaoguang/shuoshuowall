/**
 *字符串空判断
 *日期工具方法
 *loading插件
 *alert插件
 */

//字符串是否为空
String.prototype.isEmpty=function (str){
	return str==undefined||str==null||str.trim()==""||new RegExp("\\s").test(str);
}
function isEmpty(str){
	return str==undefined||str==null||str.trim()==""||new RegExp("\\s").test(str);
}

/*日期工具类*/
$.guangDate = {
 /*转换日期*/
 _transferDate : function(date){
	if(typeof date =="string"){
		return new Date(date.replace(/-/ig,"/"));
	}else{
		return date;
	}
 },
  /*格式化日期*/
 _toString : function(date,pattern){
	var d = this._transferDate(date);
	return d.format(pattern);
 },

 /*获取两个时间相减的时间*/
 _Date : function(date1,date2){
	var dateTime = this._numMillSecond(date1,date2);
	return new Date(dateTime).format("yyyy-MM-dd");
 },

 //间隔年份
 _numYear : function(date1,date2){
	var times = this._numDay(date1,date2);
	return  Math.floor(times/365);
 },

  //间隔月份
 _numMonth : function(date1,date2){
	var times = this._numDay(date1,date2);
	return  Math.floor(times/30);
 },

 //间隔天数
 _numDay : function(date1,date2){
	var times = this._numSecond(date1,date2);
	var hour = this._var().hour;
	var mills = this._var().mills;
	return Math.ceil(times/(mills * hour));
 },

//间隔时
 _numHour : function(date1,date2){
	return Math.floor(this._numMillSecond(date1,date2)/(1000*60*60));
 },

 //间隔分
 _numMinute : function(date1,date2){
	return Math.floor(this._numMillSecond(date1,date2)/(1000*60));
 },

 //间隔秒数
 _numSecond : function(date1,date2){
	 return Math.floor(this._numMillSecond(date1,date2) / 1000);
 },

  //间隔毫秒
 _numMillSecond : function(date1,date2){
	var stimes = this._getTime(this._transferDate(date1));
	var etimes = this._getTime(this._transferDate(date2));
	return etimes - stimes;
 },

 _var : function(){
	return {hour:24,second:60,mills:3600,format:"yyyy-MM-dd",dateFormat:"yyyy-MM-dd HH:mm:ss"};
 },

/*某个日期加上多少毫秒*/
 _plusMillisSeconds : function(date,millisSeconds){
	var dateTime = this._getTime(date);
	var mintimes = millisSeconds;
	var rdate = dateTime*1 + mintimes*1;
	return this._format(new Date(rdate));
 },
 /*某个日期加上多少秒*/
 _plusSeconds : function(date,seconds){
	var dateTime = this._getTime(date);
	var mintimes = seconds*1000;
	var rdate = dateTime*1 + mintimes*1;
	return this._format(new Date(rdate));
 },
  /*某个日期加上多少分钟*/
 _plusMinutes : function(date,minutes){
	var dateTime = this._getTime(date);
	var mintimes = minutes*60*1000;
	var rdate = dateTime*1 + mintimes*1;
	return this._format(new Date(rdate));
 },
  /*某个日期加上小时数*/
 _plusHours : function(date,hours){
	var dateTime = this._getTime(date);
	var mintimes = hours*60*60*1000;
	var rdate = dateTime + mintimes;
	return this._format(new Date(rdate));
 },
 /*某个日期加上天数*/
 _plusDays : function(date,days){
	var dateTime = this._getTime(date);
	var mintimes = days*60*60*1000*24;
	var rdate = dateTime*1 + mintimes*1;
	return this._format(new Date(rdate));
 },

 /*某个日期加上多少个月,这里是按照一个月30天来计算天数的*/
 _plusMonths : function(date,months){
	var dateTime = this._getTime(date);
	var mintimes = months*30*60*60*1000*24;
	var rdate = dateTime + mintimes*1;
	return this._format(new Date(rdate));
 },

 /*某个日期加上多少个年,这里是按照一个月365天来计算天数的，如果loop为true则按闰年计算*/
 _plusYears : function(date,years,isLoop){
	var dateTime = this._getTime(date);
	var day = 365;
	if(isLoop)day =366;
	var mintimes = years*day*60*60*1000*24;
	var rdate = dateTime + mintimes;
	return this._format(new Date(rdate));
 },

 /*某个日期加上某个日期，这样的操作视乎没什么意义*/
 _plusDate : function(date1,date2){
	var dateTime = this._getTime(date1);
	var dateTime2 = this._getTime(date2);;
	var rdate = dateTime + dateTime2;
	return this._format(new Date(rdate));
 },

 /*某个日期减去多少毫秒秒*/
 _minusMillisSeconds : function(date,millisSeconds){
	var dateTime = this._getTime(date);
	var mintimes = millisSeconds*1;
	var rdate = dateTime - mintimes;
	return this._format(new Date(rdate));
 },
 /*某个日期减去多少秒*/
 _minusSeconds : function(date,seconds){
	var dateTime = this._getTime(date);
	var mintimes = seconds*1000;
	var rdate = dateTime - mintimes;
	return this._format(new Date(rdate));
 },
  /*某个日期减去多少分钟*/
 _minusMinutes : function(date,minutes){
	var dateTime = this._getTime(date);
	var mintimes = minutes*60*1000;
	var rdate = dateTime - mintimes;
	return this._format(new Date(rdate));
 },
  /*某个日期减去小时数*/
 _minusHours : function(date,hours){
	var dateTime = this._getTime(date);
	var mintimes = hours*60*60*1000;
	var rdate = dateTime - mintimes;
	return this._format(new Date(rdate));
 },
 /*某个日期减去天数*/
 _minusDays : function(date,days){
	var dateTime = this._getTime(date);
	var mintimes = days*60*60*1000*24;
	var rdate = dateTime - mintimes;
	return this._format(new Date(rdate));
 },

 /*某个日期减去多少个月,这里是按照一个月30天来计算天数的*/
 _minusMonths : function(date,months){
	var dateTime = this._getTime(date);
	var mintimes = months*30*60*60*1000*24;
	var rdate = dateTime - mintimes;
	return this._format(new Date(rdate));
 },

 /*某个日期减去多少个年,这里是按照一个月365天来计算天数的*/
 _minusYears : function(date,years,isLoop){
	var dateTime = this._getTime(date);
	var day = 365;
	if(isLoop)day =366;
	var mintimes = years*day*60*60*1000*24;
	var rdate = dateTime - mintimes;
	return this._format(new Date(rdate));
 },

 /*某个日期减去某个日期，这样的操作视乎没什么意义*/
 _minusDate : function(date1,date2){
	var dateTime = this._getTime(date1);
	var dateTime2 = this._getTime(date2);;
	var rdate = dateTime - dateTime2;
	return this._format(new Date(rdate));
 },

 /*获取一个月有多少天*/
 _getMonthOfDay :function(date1){
	var currentMonth = this._getFirstDayOfMonth(date1);
	var nextMonth = this._getNextDayOfMonth(date1);
	return this._numDay(currentMonth,nextMonth);
 },

 /*获取一年又多少天*/
 _getYearOfDay : function(date){
	var firstDayYear = this._getFirstDayOfYear(date);
	var lastDayYear = this._getLastDayOfYear(date);
	return Math.ceil(this._numDay(firstDayYear,lastDayYear));
 },

 /*某个日期是当年中的第几天*/
 _getDayOfYear : function(date1){
	return Math.ceil(this._numDay(this._getFirstDayOfYear(date1),date1));	
 },

 /*某个日期是在当月中的第几天*/
  _getDayOfMonth : function(date1){
	return Math.ceil(this._numDay(this._getFirstDayOfMonth(date1),date1));	
 },

 /*获取某个日期在这一年的第几周*/
 _getDayOfYearWeek : function(date){
	var numdays = this._getDayOfYear(date);
	return Math.ceil(numdays / 7);
 },

  /*某个日期是在当月中的星期几*/
  _getDayOfWeek : function(date1){
	return this._getWeek(date1);
 },

 /*获取在当前日期中的时间*/
 _getHourOfDay : function(date){
	 return this._getHour(date);
 },
 _eq : function(date1,date2){
	 var stime = this._getTime(this._transferDate(date1));
	 var etime = this._getTime(this._transferDate(date2));
	 return stime == etime ? true :false; 
 },
 /*某个日期是否晚于某个日期*/
 _after : function(date1,date2){
	 var stime = this._getTime(this._transferDate(date1));
	 var etime = this._getTime(this._transferDate(date2));
	 return  stime < etime ? true :false; 
 },

  /*某个日期是否早于某个日期*/
 _before : function(date1,date2){
	 var stime = this._getTime(this._transferDate(date1));
	 var etime = this._getTime(this._transferDate(date2));
	 return  stime > etime ? true :false; 
 },
 
 /*获取某年的第一天*/
 _getFirstDayOfYear : function(date){
	var year = this._getYear(date);
	var dateString = year+"-01-01 00:00:00";
	return dateString;
 },

  /*获取某年的最后一天*/
 _getLastDayOfYear : function(date){
	var year = this._getYear(date);
	var dateString = year+"-12-01 00:00:00";
	var endDay = this._getMonthOfDay(dateString);
	return year+"-12-"+endDay+" 23:59:59";
 },

  /*获取某月的第一天*/
 _getFirstDayOfMonth: function(date){
	var year = this._getYear(date);
	var month = this._getMonth(date);
	var dateString = year +"-"+month+"-01 00:00:00";
	return dateString;
 },

 /*获取某月最后一天*/
 _getLastDayOfMonth : function(date){
	var endDay = this._getMonthOfDay(date);
	var year = this._getYear(date);
	var month = this._getMonth(date);
	return year +"-"+month+"-"+endDay+" 23:59:59";
 },
 /*一天的开始时间*/
 _getFirstOfDay : function(date){
	 var year = this._getYear(date);
	 var month = this._getMonth(date);
	 var dates = this._getDay(date);
	 return year+"-"+month+"-"+dates+" 00:00:00";
 },

 /*一天的结束时间*/
 _getLastOfDay : function(date){
	 var year = this._getYear(date);
	 var month = this._getMonth(date);
	 var dates = this._getDay(date);
	 return year+"-"+month+"-"+dates+" 23:59:59";
 },
 
 /*获取下个月的第一天*/
 _getNextDayOfMonth: function(date){
	var year = this._getYear(date);
	var month = this._getMonth(date);
	month = month * 1 +1;
	if(month>12){
		year = year+1;
		month = month - 12;
	}
	month = month>9 ? month : "0"+month;
	var dateString = year +"-"+month+"-01 00:00:00";
	return dateString;
 },

 _getFirstOfWeek : function(date1){
	 var week = this._getWeek(date1);
	 var date = this._minusDays(date1,week);
	 var year = this._getYear(date);
	 var month = this._getMonth(date);
	 var dates = this._getDay(date);
	 return year+"-"+month+"-"+dates+" 00:00:00";
 },
 
 _getLastOfWeek : function(date1){
	 var week = 6-this._getWeek(date1);
	 var date = this._minusDays(date1,week);
	 var year = this._getYear(date);
	 var month = this._getMonth(date);
	 var dates = this._getDay(date);
	 return year+"-"+month+"-"+dates+" 23:59:59";
 },
 
 _getNow : function(){
	return new Date();	
 },
 _format : function(date){
	return this._getYear(date)+"-"+this._getMonth(date)+"-"+this._getDay(date)+" "+this._getHour(date)+":"+this._getMinute(date)+":"+this._getSecond(date);
 },
 _getDate :function(){
	 return this._getNow();
 },
 /*年*/
 _getYear:function(date){
	 return this._transferDate(date).getFullYear();
 },

 /*月*/
 _getMonth:function(date){
	 var month = this._transferDate(date).getMonth()+1;
	 return month>9 ? month : "0"+month;
 },

 /*日*/
 _getDay:function(date){
	 var day = this._transferDate(date).getDate();
	 return day >9 ? day : "0"+day;
 },

  /*获取今天星期几,如果为0代表星期日*/
 _getWeek : function(date){
	 return this._transferDate(date).getDay();
 },

 /*时*/
 _getHour : function(date){
	 var hour = this._transferDate(date).getHours();
	 return hour >9 ? hour : "0"+hour;
 },

 /*12小时制时*/
 _getHour12 : function(date){
	 var hour = this._transferDate(date).getHours();
	 return hour%12 == 0 ? 12 : hour % 12;
 },

 /*分*/
 _getMinute : function(date){
	 var minutes = this._transferDate(date).getMinutes();
	 return minutes >9 ? minutes : "0"+minutes;
 },

 /*秒*/
 _getSecond : function(date){
	var seconds = this._transferDate(date).getSeconds();
	return seconds >9 ? seconds : "0"+seconds;
 },

 /*毫秒*/
 _getMillisecond : function(date){
	return this._transferDate(date).getMilliseconds();
 },

 /*获取今天在当年是第几季度*/
 _getPeriod : function(date){
	var month = this._getMonth(date)*1;
	return  Math.floor((month+3)/3);
 },

 /*星期*/
 _nowWeekChinies : function(date){
	var nowWeek = this._getWeek(date);
	var day = "";
	switch (nowWeek){
		case 0:day="日";break;
		  break;
		case 1:day="一";break;
		  break;
		case 2:day="二";break;
		  break;
		case 3:day="三";break;
		  break;
		case 4:day="四";break;
		  break;
		case 5:day="五";break;
		  break;
		case 6:day="六";break;
	 }
	 return day;
 },

 /*返回 1970 年 1 月 1 日至今的毫秒数。*/
 _getTime : function(date){
	 return this._transferDate(date).getTime();
 }
};
//小光Loading插件
var guangLoading={
	templates:function(){
		return "<div id='loadingBar'></div>";
	},
	params:{},
	defaultParams:{},
	init:function(json){
		$.extend(this.params,{},this.defaultParams,json);
		if($("#loadingBar")){
			$("body").append(this.templates());
		}
		if(this.params.bgColor){
			$("#loadingBar").css("background-color",this.params.bgColor);
		}
		return this;
	},
	show:function(){
		$("#loadingBar").show();
		return this;
	},
	hide:function(){
		$("#loadingBar").hide(function(){
			this.remove();
		});
		return this;
	},
	fadeIn:function(time){
		if(time){
			$("#loadingBar").fadeIn(time);
		}else{
			$("#loadingBar").fadeIn();
		}
		return this;
	},
	fadeOut:function(time){
		if(time){
			$("#loadingBar").fadeOut(time,function(){
				this.remove();
			});
		}else{
			$("#loadingBar").fadeOut(function(){
				this.remove();
			});
		}
		return this;
	}
};
//小光提示框插件
var guangAlert={
		templates:function(){
			return 	"<div id='guangAlert'>"+
			"<div class='a_title'><span>提示</span><a href='javascript:void(0);' class='a_close'>X</a></div>"+
			"<div class='a_content clearfix'>"+
			"	<p>我是小光弹出框的内容</p>"+
			"	<button>确认</button>"+
			"</div>"+
		    "</div><div id='guang_mask'></div>";
		},
		params:{},
		defaultParams:{
			mask:true
		},
		init:function(json){
			$.extend(this.params,{},this.defaultParams,json);
			if($("#guangAlert")){
				$("body").append(this.templates());
			}
			this.center();
			if(this.params.title){
				$("#guangAlert").find(".a_title span").text(this.params.title);
			}
			if(this.params.content){
				$("#guangAlert").find(".a_content p").text(this.params.content);
			}
			if(this.params.mask){
				$("#guang_mask").height($(window).height());
			}
			this.bindEvents();
			return this;
		},
		bindEvents:function(){
			var _this=this;
			//确认按钮事件
			$("#guangAlert").find(".a_content button").on("click",function(){
				_this.fadeOut();
				if(_this.params.callback){
					_this.params.callback();
				}
			});
			$("#guangAlert").find(".a_title .a_close").on("click",function(){
				_this.fadeOut();
				if(_this.params.callback){
					_this.params.callback();
				}				
			});
			return this;
		},
		show:function(){
			if(this.params.mask){
				$("#guang_mask").show();
			}
			$("#guangAlert").show();
			return this;
		},
		hide:function(){
			if(this.params.mask){
				$("#guang_mask").hide(function(){
					this.remove();
				});
			}
			$("#guangAlert").hide(function(){
				this.remove();
			});
			return this;
		},
		fadeIn:function(time){
			if(this.params.mask){
				$("#guang_mask").show();
			}
			if(time){
				$("#guangAlert").fadeIn(time);
			}else{
				$("#guangAlert").fadeIn();
			}
			return this;
		},
		fadeOut:function(time){
			if(this.params.mask){
				$("#guang_mask").fadeOut(function(){
					this.remove();
				});
			}
			if(time){
				$("#guangAlert").fadeOut(time,function(){
					this.remove();
				});
			}else{
				$("#guangAlert").fadeOut(function(){
					this.remove();
				});
			}
			return this;
		},
		center:function(){
			var winWidth=$(window).width();
			var winHeight=$(window).height();
			var boxWidth=$("#guangAlert").width();
			var boxHeight=$("#guangAlert").height();
			var cLeft=(winWidth-boxWidth)/2;
			var cTop=(winHeight-boxHeight)/2;
			$("#guangAlert").css({left:cLeft,top:cTop});
			return this;
		}
};
//小光无限滚动
function guangUnlimitedScroll(callback){
	var _height=$(window).height();
	$(window).scroll(function(){
		var scrollHeight=document.body.scrollHeight;
		var scrollTop=document.body.scrollTop;
		if(scrollTop+_height>=scrollHeight){
			if(callback){
				callback();
			}
		}	
	});
}
