import csv, json

employeeList = {}  # key is full name and the value is a list of other information

with open("sbceo_directory2017.csv", "rb") as file:
	reader = csv.reader(file)
	# contains name
	employeeList = {"Superintendent" : {}, "Deputy Superintendent" : {}, "Administrative Services" : {}, "Curriculum and Instruction" : {}, "Educational Services" : {}, "Human Resources" : {}, "Special Education" : {}}
	
	i = 0
	for row in reader:
		if i == 0:
			i+=1
			continue
		key = hex(i)
		if len(key) == 3:
			key = "%s00%s"%(key[:2], key[-1:])
		elif len(key) == 4:
			key = "%s0%s"%(key[:2], key[-2:])
		# keys are 5 digit hex in case of duplicate first last name
		name = "%s %s" %(row[1],row[0])
		division = row[2]
		job = row [3]
		ext = row[4] #this is going to be an issue spot, can fix later; empty ext or phone number
		email = row[5]
		
		employeeList[division][key] = {"name" : name, "job" : job, "ext" : ext, "email" : email}
		
		
		i += 1
		
# do this in a good format

# then change dict into json

print(json.dumps(employeeList, indent = 4))

with open('sbceoData.json', 'w') as file:
     json.dump(employeeList, file)
