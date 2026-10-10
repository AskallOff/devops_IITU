echo "Stud info"
echo -----------
echo ""
echo
echo "Name: Abai"
echo "Surnane: Asan"
echo "Group: IT2-2304"
echo "Stud id: 123456"
echo ""
echo "System info"
echo "username: $(whoami)"
echo "hostname: $(hostname)"
echo "curr date: $(date)"
echo "OS: $(uname -s -r)"
echo "Disk Usage: df -h / | awk 'NR==1 || NR ==2' 
echo ""
echo "Memory Usage:
free -h
echo ""

if [ -f "Asan_Abaika_inf.txt" ]; then
    echo "Studebt info file exist"
else
    echo "Student info file not exist emae"
fi
