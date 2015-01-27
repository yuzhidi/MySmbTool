echo $*
SMB_CMD="smbclient //10.120.10.100/CKT_CD_SHARE/ -U liang.wang%password -c 'cd \"$*\"; ls;'"
#SMB_CMD="smbclient //10.120.10.100/CKT_CD_SHARE/ -U liang.wang%password -c 'cd "$*"; ls;prompt;recurse; mget *'"
echo $SMB_CMD
smbclient //10.120.10.100/CKT_CD_SHARE/ -U liang.wang%password -c "cd $*; ls;"

echo "is this you wanted, input [Y] download; other cancel:"
read Var
if [ "$Var" == Y -o "$Var" == y ]; then
    smbclient //10.120.10.100/CKT_CD_SHARE/ -U liang.wang%password -c "cd $*; ls;prompt;recurse; mget *"
else
    echo cancel
fi
