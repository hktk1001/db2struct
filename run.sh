
echo
cat readme_linhc.md
echo

#数据库host
dbhost="192.168.67.9"

#库名
dbname="clerk"

#数据密码
pwd=$IMPORT_DB_PWD

#生成的model存放目录
path="/Users/linhaicheng/tmp/mis"


#path="/c/Users/admin/Desktop"
#path="/f/code/go/src/mis/internal/"run
#path="/f/code/go/src/oms/internal"
#dbname="oms"
#dbname="information_schema"

 if [ -z "$pwd" ];then
    echo "请设置环境变量（数据库密码） IMPORT_DB_PWD   举个票子: export IMPORT_DB_PWD=\"xxx\""
    exit 1
 fi



mkdir -p "$path/model"

function create() {
    table=$1
    st=$2
    ./db2struct --host $dbhost -d $dbname -t $table --package model --struct $st  -p $pwd --user root  --json  --gorm >$path/model/$table.go
    echo "file =  $path/model/$table.go"
    echo "create table $table to  struct $st  $pwd"
    cat $path/model/$table.go
}
echo "start..."

#create  表名 结构体名字
#create "mis_import_history" "MisImportHistory"

#mis------
#create "mis_import_history" "MisImportHistory"
#create "mis_flows" "MisFlows"
#create "mis_flow_template" "MisFlowTemplate"

#create "ats_detail" "AtsDetail"
#create "ats_monthly" "AtsMonthly"

#create "mis_wage_tax" "MisWageTax"
#create "mis_user_info" "MisUserInfo"
#create "mis_lock" "MisLock"
#create "COLUMNS" "TColumn"ls

#create "mis_hr_pwd" "MisHrPWD"
#create "mis_wage_pwd" "MisWagePWD"
#create "mis_setting_allowance" "MisSettingAllowance"
#create "mis_setting_ats" "MisSettingAts"
#create "mis_setting_joblevel" "MisSettingJobLevel"
#create "mis_user_info" "MisUserInfo"
#create "mis_setting_severance" "MisSettingSeverance"
#create "mis_accident_judge" "MisAccidentJudge"




#oms===
#create "brand" "OmsBrand"
#create "cluster" "OmsCluster"
#create "configure" "OmsConfigure"
#create "configure_history" "OmsConfigureHistory"
#create "ecs" "OmsEcs"
#create "env" "OmsEnv"
#create "env_history" "OmsEnvHistory"
#create "image" "OmsImage"
#create "instance" "OmsInstance"
#create "instance_groups" "OmsInstanceGroups"
#create "package" "OmsPackage"
#create "script" "OmsScript"
#create "script_history" "OmsScriptHistory"
#create "security_group" "OmsSecurityGroup"
#create "service_type" "OmsServiceType"
#

echo "success, please open $path"

