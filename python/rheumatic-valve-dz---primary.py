# Kuan V, Denaxas S, Gonzalez-Izquierdo A, Direk K, Bhatti O, Husain S, Sutaria S, Hingorani M, Nitsch D, Parisinos C, Lumbers T, Mathur R, Sofat R, Casas JP, Wong I, Hemingway H, Hingorani A, 2023.

import sys, csv, re

codes = [{"code":"105626.0","system":"med"},{"code":"16545.0","system":"med"},{"code":"18100.0","system":"med"},{"code":"1885.0","system":"med"},{"code":"21807.0","system":"med"},{"code":"21980.0","system":"med"},{"code":"22837.0","system":"med"},{"code":"31505.0","system":"med"},{"code":"32211.0","system":"med"},{"code":"32435.0","system":"med"},{"code":"36768.0","system":"med"},{"code":"42239.0","system":"med"},{"code":"43347.0","system":"med"},{"code":"44167.0","system":"med"},{"code":"44328.0","system":"med"},{"code":"44488.0","system":"med"},{"code":"50809.0","system":"med"},{"code":"50983.0","system":"med"},{"code":"51879.0","system":"med"},{"code":"54088.0","system":"med"},{"code":"59275.0","system":"med"},{"code":"60266.0","system":"med"},{"code":"62186.0","system":"med"},{"code":"62207.0","system":"med"},{"code":"63960.0","system":"med"},{"code":"72613.0","system":"med"},{"code":"7963.0","system":"med"},{"code":"93113.0","system":"med"},{"code":"93114.0","system":"med"},{"code":"9391.0","system":"med"},{"code":"94521.0","system":"med"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('rheumatic-valve-dz-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["rheumatic-valve-dz---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["rheumatic-valve-dz---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["rheumatic-valve-dz---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
