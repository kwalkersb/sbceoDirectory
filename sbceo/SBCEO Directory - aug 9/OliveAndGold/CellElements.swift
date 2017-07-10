//
//  Elements.swift
//  OliveAndGold
//  Created by Evan Heffernan on 4/12/16.
//  Copyright © 2016 com.4myeecc. All rights reserved.
//

import Foundation

class CellElements {
    
    static let sharedInstance = CellElements()
    let oneElementsArray: [String]! // Departments
    let newArrays: [[String]?]
    var tempObjectArray: [[[String]?]]!
    
    var cell0: [String]!
    var cell1: [String]!
    var cell2: [String]!
    var cell3: [String]!
    var cell4: [String]!
    var cell5: [String]!
    var cell6: [String]!
    var cell7: [String]!
    
    var cellD0: [[String]?]
    var cellD1: [[String]?]
    var cellD2: [[String]?]
    var cellD3: [[String]?]
    var cellD4: [[String]?]
    var cellD5: [[String]?]
    var cellD6: [[String]?]
    var cellD7: [[String]?]
    
    var williamCirone: [String]!
    var annaFreedland: [String]!
    var suzanneMcDonald: [String]!
    var susanSalcido: [String]!
    var faithHopwood: [String]!
    var billRidgeway: [String]!
    var sharonGundy: [String]!
    var kellyKavanaugh: [String]!
    var denicCora: [String]!
    var ellenBarger: [String]!
    var patNoronha: [String]!
    var mattZuchowicz: [String]!
    var ginaBranum: [String]!
    var steveKeithley: [String]!
    var carlaBenchoff: [String]!
    var cassandraBautista: [String]!
    var carlosPagán: [String]!
    var kathyHollis: [String]!
    var brigitteAlmquist: [String]!
    var trudyAdairVerbais: [String]!
    var floreneBednersh: [String]!
    var georgeneLowe: [String]!
    var maryellenRehse: [String]!
    var traileEasland: [String]!
    var kathyKoury: [String]!
    var reneWheeler: [String]!
    var mariaGarciaCacique: [String]!
    var tonyBauer: [String]!
    var doloresDaniel: [String]!
    var mariBaptista: [String]!
    var janeJackson: [String]!
    var jessicaLopez: [String]!
    var vacant: [String]!
    var wendyGarcia: [String]!
    var tracieCordero: [String]!
    var tomHeiduk: [String]!
    var catherineBreen: [String]!
    var debyGeiger: [String]!
    var kathyGulje: [String]!
    var lindaChase: [String]!
    var cathyDeLaurentis: [String]!
    var rachelFauver: [String]!
    var janelleWillis: [String]!
    var davidLawrence: [String]!
    var traceyBeauchamp: [String]!
    var steveSmith: [String]!
    var mattEvans: [String]!
    var luisMedina: [String]!
    var olgaAguilar: [String]!
    var joanGilmore: [String]!
    var scottSpector: [String]!
    
    init()
    {
        oneElementsArray = ["Superintendent", "Deputy Superintendent", "Administrative Services", "Curriculum and Instruction", "Education Services", "Human Resources", "Special Education", "Communications"]
        cell0 = ["William J, Cirone", "Anna Freedland", "Suzanne McDonald"]
        cell1 = ["Susan Salcido", "Faith Hopwood"]
        cell2 = ["Bill Ridgeway", "Faith Hopwood", "Sharon Van Gundy", "Kelly Kavanaugh", "Denice Cora"]
        cell3 = ["Ellen Barger", "Pat Noronha", "Matt Zuchowicz", "Gina Branum", "Steve Keithley", "Carla Benchoff", "Cassandra Bautista", "Carlos Pagán", "Scott Spector"]
        cell4 = ["Kathy Hollis", "Brigitte Almsquist", "Trudy Adair-Verbais", "Dr. Florene Bednersh", "Georgene Lowe", "MaryEllen Rehse (MSW)", "Traile Easland (BSN, R.N., IBCLC)", "Kathy Koury", "Rene Wheeler", "Maria Garcia-Cacique", "Tony Bauer", "Dolores Daniel"]
        cell5 = ["Mari Minjarez Baptista", "Jane Jackson", "Jessica Lopez", "Vacant", "Wendy Garcia", "Tracie Cordero", "Tom Heiduk"]
        cell6 = ["Catherine Breen", "Deby Geiger", "Kathy Gulje", "Linda Chase", "Cathy DeLaurentis", "Rachel Fauver", "Janelle Willis"]
        cell7 = ["David Lawrence", "Tracey Beauchamp", "Steve Smith", "Matt Evans", "Luis Medina", "Olga Aguilar", "Joan Gilmore"]
        newArrays = [cell0, cell1, cell2, cell3, cell4, cell5, cell6, cell7]
        
        williamCirone = ["William J. Cirone", "County Superintendent of Schools", "bcirone@sbceo.org", "8059644710", "5286"]
        annaFreedland = ["Anna Freedland", "Executive Assistant to the County Superintendent of Schools", "afreedland@sbceo.org", "8059644710", "5216"]
        suzanneMcDonald = ["Suzanne McDonald", "Administrative Secretary, Superintendent's Office", "smcdonald@sbceo.org", "8059644710", "5285"]
        susanSalcido = ["Susan Salcido", "Deputy Superintendent", "ssalcido@sbceo.org", "8059644710", "5205"]
        faithHopwood = ["Faith Hopwood", "Administrative Secretary", "fhopwood@sbceo.org", "8059644710", "5243"]
        billRidgeway = ["Bill Ridgeway", "Assistant Superintendent", "bridgeway@sbceo.org", "8059644710", "5700"]
        sharonGundy = ["Sharon Van Gundy", "Administrator, Information Technology Services", "sharonv@sbceo.org", "8059644710", "5298"]
        kellyKavanaugh = ["Kelly Kavanaugh", "Administrator, Internal Services", "kkavanaugh@sbceo.org", "8059644710", "5227"]
        denicCora = ["Denice Cora", "Administrator, School Business Advisory Services", "dcora@sbceo.org", "8059644710", "5237"]
        ellenBarger = ["Ellen Barger", "Assistant Superintendent", "ebarger@sbceo.org", "8059644710", "5066"]
        patNoronha = ["Pat Noronha", "Administrative Analyst", "pnoronha@sbceo.org", "8059644710", "5289"]
        mattZuchowicz = ["Matt Zuchowicz", "Director, Educational Technology", "zuchowicz@sbceo.org", "8059644710", "5247"]
        ginaBranum = ["Gina Branum", "Director, Teacher Induction Program", "gbranum@sbceo.org", "8059644710", "5430"]
        steveKeithley = ["Steve Keithley", "Director, Teacher Programs and Support", "skeithley@sbceo.org", "8059644710", "5281"]
        carlaBenchoff = ["Carla Benchoff", "Coordinator, Instructional Support", "cbenchoff@sbceo.org", "8059644710", "5373"]
        cassandraBautista = ["Cassandra Bautista", "Director, English Learner Support", "cbautista@sbceo.org", "8059644710", "5407"]
        carlosPagán = ["Carlos Pagán", "Director, Literacy & Language Support", "cpagan@sbceo.org", "8059644710", "5436"]
        kathyHollis = ["Kathy Hollis", "Assistant Superintendent", "khollis@sbceo.org", "8059644710", "5264"]
        brigitteAlmquist = ["Brigitte Almquist", "Administrative Analyst", "balmquist@sbceo.org", "8059644710", "5217"]
        trudyAdairVerbais = ["Trudy Adair-Verbais", "Director, Child Development Programs", "tverbais@sbceo.org", "8059644710", "4464"]
        floreneBednersh = ["Dr. Florene Bednersh", "Administrator, Children and Family Resource Services", "flogo@sbceo.org", "8059644710", "4480"]
        georgeneLowe = ["Georgene Lowe", "RN Coordinator, Health Linkages Program", "glowe@sbceo.org", "8059644710", "4453"]
        maryellenRehse = ["MaryEllen Rehse (MSW)", "Oral Health Program Manager", "mrehse@sbceo.org", "8059644710", "4465"]
        traileEasland = ["Traile Easland (BSN, R.N., IBCLC)", "Welcome Every Baby (WEB) Nurse Manager", "traile.webrn@sbceo.org", "8057291593", ""]
        kathyKoury = ["Kathy Koury", "Executive Director, Children's Creative Project", "ccp@sbceo.org", "8059644710", "4411"]
        reneWheeler = ["Rene Wheeler", "Director, Juvenile Court and Community Schools", "rwheeler@sbceo.org", "8059675307", ""]
        mariaGarciaCacique = ["Maria Garcia-Cacique", "Regional Director, Migrant Education Program", "mgcacique@sbceo.org", "8059644710", "4478"]
        tonyBauer = ["Tony Bauer", "Director, Regional Occupation, Program/Continuing Technical Education", "bauer@sbceo.org", "8059378427", ""]
        doloresDaniel = ["Dolores Daniel", "Program Manager, Transitional Youth Services", "ddaniel@sbceo.org", "8059644710", "4415"]
        mariBaptista = ["Mari Minjarez Baptista", "Assistant Superintendent", "mbaptista@sbceo.org", "8059644710", "5279"]
        janeJackson = ["Jane Jackson", "Director, Human Resources", "jjackson@sbceo.org", "8059644710", "5256"]
        jessicaLopez = ["Jessica Lopez", "Certificated Human Resources Specialist", "jlopez@sbceo.org", "8059644710", "5208"]
        vacant = ["Vacant", "Classified Human Resources Specialist", "", "8059644710", "5225"]
        wendyGarcia = ["Wendy Garcia", "Certificated Human Resources Technician", "wgarcia@sbceo.org", "8059644710", "5258"]
        tracieCordero = ["Tracie Cordero", "Classified Human Resources Technician", "tcordero@sbceo.org", "8059644710", "5212"]
        tomHeiduk = ["Tom Heiduk", "Credentials Analyst", "theiduk@sbceo.org", "8059644710", "5266"]
        catherineBreen = ["Catherine Breen", "Assistant Superintendent", "cbreen@sbceo.org", "8059644710", "5410"]
        debyGeiger = ["Deby Geiger", "Director", "dgeiger@sbceo.org", "8059644710", "5416"]
        kathyGulje = ["Kathy Gulje", "South County Coordinator", "kgulje@sbceo.org", "8059644710", "5415"]
        lindaChase = ["Linda Chase", "North County Coordinator", "lchase@sbceo.org", "8059220334", "2306"]
        cathyDeLaurentis = ["Cathy DeLaurentis", "North County Coordinator", "cdelaurentis@sbceo.org", "8059220334", "2308"]
        rachelFauver = ["Rachel Fauver", "North County Coordinator", "rfauver@sbceo.org", "8059220334", "2319"]
        janelleWillis = ["Janelle Willis", "North County Coordinator", "jwillis@sbceo.org", "8059220334", "2312"]
        davidLawrence = ["David Lawrence", "Director of Communications", "dlawrence@sbceo.org", "8059644710", "5282"]
        traceyBeauchamp = ["Tracey Beauchamp", "Administrative Assistant to the Director of Communications", "traceyb@sbceo.org", "8059644710", "5290"]
        steveSmith = ["Steve Smith", "Reprographics Supervisor", "printshop@sbceo.org", "8059644710", "5253"]
        mattEvans = ["Matt Evans", "Reprographics/Communications, Administrative Assistant", "mevans@sbceo.org", "8059644710", "5240"]
        luisMedina = ["Luis Medina", "Duplicating Equipment Operator", "lmedina@sbceo.org", "8059644710", "5253"]
        olgaAguilar = ["Olga Aguila", "Graphics Artist", "oaguilar@sbceo.org", "8059644710", "5270"]
        joanGilmore = ["Joan Gilmore", "Webmaster", "jgilmore@sbceo.org", "8059644710", "5276"]
        scottSpector = ["Scott Spector", "Innovation and Academic Events Coordinaor", "sspector@sbceo.org", "8059644710","5348"]
        
        cellD0 = [williamCirone, annaFreedland, suzanneMcDonald]
        cellD1 = [susanSalcido, faithHopwood]
        cellD2 = [billRidgeway, faithHopwood, sharonGundy, kellyKavanaugh, denicCora]
        cellD3 = [ellenBarger, patNoronha, mattZuchowicz, ginaBranum, steveKeithley, carlaBenchoff, cassandraBautista, carlosPagán, scottSpector]
        cellD4 = [kathyHollis, brigitteAlmquist, trudyAdairVerbais, floreneBednersh, georgeneLowe, maryellenRehse, traileEasland, kathyKoury, reneWheeler, mariaGarciaCacique, tonyBauer, doloresDaniel]
        cellD5 = [mariBaptista, janeJackson, jessicaLopez, vacant, wendyGarcia, tracieCordero, tomHeiduk]
        cellD6 = [catherineBreen, debyGeiger, kathyGulje, lindaChase, cathyDeLaurentis, rachelFauver, janelleWillis]
        cellD7 = [davidLawrence, traceyBeauchamp, steveSmith, mattEvans, luisMedina, olgaAguilar, joanGilmore]
        tempObjectArray = [cellD0, cellD1, cellD2, cellD3, cellD4, cellD5, cellD6, cellD7]
    }
}
