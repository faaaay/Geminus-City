
var/const/ENGSEC				=(1<<0)

var/const/CAPTAIN				=(1<<0)
var/const/HOS					=(1<<1)
var/const/WARDEN				=(1<<2)
var/const/DETECTIVE				=(1<<3)
var/const/OFFICER				=(1<<4)
var/const/CHIEF				=(1<<5)
var/const/ENGINEER				=(1<<6)
var/const/ATMOSTECH				=(1<<7)
var/const/AI					=(1<<8)
var/const/CYBORG				=(1<<9)

var/const/POL_CADET				=(1<<11)

var/const/MEDSCI				=(1<<1)

var/const/RD					=(1<<0)
var/const/SCIENTIST				=(1<<1)
var/const/CHEMIST				=(1<<2)
var/const/CMO					=(1<<3)
var/const/DOCTOR				=(1<<4)
var/const/GENETICIST			=(1<<5)
var/const/VIROLOGIST			=(1<<6)
var/const/PSYCHIATRIST			=(1<<7)
var/const/ROBOTICIST			=(1<<8)
var/const/XENOBIOLOGIST			=(1<<9)
var/const/PARAMEDIC				=(1<<10)
var/const/MEDICALINTERN			=(1<<11)
var/const/SCIENCEINTERN			=(1<<12)
var/const/SCIGUARD				=(1<<13)

var/const/CIVILIAN				=(1<<2)

var/const/HOP					=(1<<0)
var/const/BARTENDER				=(1<<1)
var/const/BOTANIST				=(1<<2)
var/const/CHEF					=(1<<3)
var/const/JANITOR				=(1<<4)
var/const/JOURNALIST			=(1<<5)
var/const/QUARTERMASTER			=(1<<6)
var/const/CARGOTECH				=(1<<7)
var/const/MINER				=(1<<8)
var/const/LAWYER				=(1<<9)

var/const/CHAPLAIN				=(1<<10)
var/const/ASSISTANT				=(1<<11)
var/const/BRIDGE				=(1<<12)
var/const/PROSECUTOR			=(1<<13)
var/const/BARBER				=(1<<14)
var/const/SECRETARY				=(1<<15)
var/const/JUDGE				=(1<<16)
var/const/PRISONER				=(1<<17)
var/const/MANAGER         	     =(1<<18)

var/const/GOVLAW				=(1<<3)

var/const/PRESIDENT				=(1<<0)
var/const/NANOTRASEN			=(1<<1)
var/const/PDSI					=(1<<2)
var/const/CEO					=(1<<3)
var/const/GOVERNOR				=(1<<4)
var/const/VICEPRESIDENT			=(1<<5)
var/const/SUPREMEJUSTICE			=(1<<6)
var/const/ADVISORDEFENSE			=(1<<7)
var/const/ADVISORJUSTICE			=(1<<8)
var/const/ADVISORINNOVATION		=(1<<9)
var/const/ADVISORHEALTH			=(1<<10)
var/const/ADVISORFINANCE			=(1<<11)

var/list/assistant_occupations = list(
	"Civilian"
)


var/list/gov_positions = list(
	"Governor",
	"Government Representative",
	"PDSI Agent",
	"President",
	"Vice President",
	"Nanotrasen CEO",
	"Supreme Justice",
	"Advisor of Defense",
	"Advisor of Justice",
	"Advisor of Innovation",
	"Advisor of Health",
	"Advisor of Finance"

)

var/list/command_positions = list(
	"Mayor",
	"City Clerk",
	"Chief of Police",
	"Maintenance Director",
	"Judge",
	"Research Director",
	"Medical Director"
)


var/list/engineering_positions = list(
	"Maintenance Director",
	"Maintenance Worker",
	"Sanitation Technician"
)


var/list/medical_positions = list(
	"Medical Director",
	"Doctor",
	"Geneticist",
	"Psychiatrist",
	"Chemist",
	"Paramedic",
	"Medical Intern"
)


var/list/science_positions = list(
	"Research Director",
	"Scientist",
	"Geneticist",	//Part of both medical and science
	"Roboticist",
	"Xenobiologist",
	"Research Assistant"
)

//BS12 EDIT
var/list/cargo_positions = list(
	"Factory Manager",
	"Factory Worker",
	"Miner"
)

var/list/civilian_positions = list(
	"City Clerk",
	"Judge",
	"Defense Attorney",
	"Chaplain",
	"Civilian",
	"City Hall Guard",
	"City Hall Secretary",
)


var/list/security_positions = list(
	"Chief of Police",
	"Prison Warden",
	"Detective",
	"Police Officer",
	"District Prosecutor",
	"Police Cadet"
)


var/list/planet_positions = list(
	"Explorer",
	"Pilot",
	"Search and Rescue"
)


var/list/nonhuman_positions = list(
	"AI",
	"Cyborg",
	"pAI"
)


/proc/guest_jobbans(var/job)
	return ((job in command_positions) || (job in nonhuman_positions) || (job in security_positions))


/proc/get_job_datums()
	var/list/occupations = list()
	var/list/all_jobs = typesof(/datum/job)

	for(var/A in all_jobs)
		var/datum/job/job = new A()
		if(!job)	continue
		occupations += job

	return occupations

/proc/get_alternate_titles(var/job)
	var/list/jobs = get_job_datums()
	var/list/titles = list()

	for(var/datum/job/J in jobs)
		if(J.title == job)
			titles = J.alt_titles

	return titles
