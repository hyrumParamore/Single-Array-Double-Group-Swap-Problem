//
//  ContentView.swift
//  DoubleGroupArraySwapProgram
//
//  Created by Hyrum Paramore on 12/21/23.
//
// This program helps to solve a specific problem that I had come across while building another app. It is that I have one array that contains a lits of sections that are being filtered out do display different elements assigned to those sections. The issue is that while I had these different sections, I was in need to move a section up and down an array to get it to display where I wanted it. The issue is that I have different groups for each section and they are displaying different elements all around the app, but I want to move it up in the array without changing the location

import SwiftUI


struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    var count: Int = 0
    
    
    var body: some View {
        
        let halfwayIndex = viewModel.sections.count / 2
        let firstColumn = viewModel.sections[..<halfwayIndex]
        let secondColumn = viewModel.sections[halfwayIndex...]
        
        NavigationView {
            
            ZStack {
                Color(.gray.opacity(0.10))
                    .ignoresSafeArea()
                
                VStack {
                    
                    VStack {
                        HStack {
                            Text("Group 1")
                                .font(.headline)
                                .underline()
                            
                            Spacer()
                            
                            Text("Move Section")
                                .font(.headline)
                                .underline()
                                .padding(.trailing, 10)
                        }
                        .padding(.horizontal, 20)
                        
                        ForEach(Array(viewModel.sections.enumerated()), id: \.element.id) { index, section in
                            if section.group == "Group 1" {
                                HStack {
                                    Text("\(section.title)")
                                        .fontWeight(.bold)
                                        .foregroundStyle(Color.green)
                                    
                                    Spacer()
                                    
                                    // Move a section Up
                                    Button {
                                        viewModel.moveSectionUp(sectionIndex: index, groupNumber: 1)

                                    } label: {
                                        Text("Up")
                                            .font(.callout)
                                            .foregroundColor(Color.white)
                                            .frame(width: 60, height: 25)
                                            .background(.blue)
                                            .bold()
                                            .cornerRadius(8)
                                    }
                                    
                                    // Move a section Down
                                    Button {
                                        viewModel.moveSectionDown(sectionIndex: index, groupNumber: 1)
                                    } label: {
                                        Text("Down")
                                            .font(.callout)
                                            .foregroundColor(Color.white)
                                            .frame(width: 60, height: 25)
                                            .background(.blue)
                                            .bold()
                                            .cornerRadius(8)
                                    }
                                }
                            }
                        }
                        .id(UUID())
                        .padding(.horizontal, 20)
                    }

                    
                    Divider()
                        .frame(height: 1)
                        .overlay(Color.gray)
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                    
                    
                    VStack {
                        HStack {
                            Text("Group 2")
                                .font(.headline)
                                .underline()
                            Spacer()
                        }
                        .padding(.horizontal, 20)
                        
                        ForEach(Array(viewModel.sections.enumerated()), id: \.element.id) { index, section in
                            if section.group == "Group 2" {
                                HStack {
                                    Text("\(section.title)")
                                        .fontWeight(.bold)
                                        .foregroundStyle(Color.orange)
                                    
                                    
                                    Spacer()
                                    
                                    // Move the section up
                                    Button {
                                        //                                    viewModel.moveSectionUp(sectionIndex: index)
                                        viewModel.moveSectionUp(sectionIndex: index, groupNumber: 2)
                                        
                                    } label: {
                                        Text("Up")
                                            .font(.callout)
                                            .foregroundColor(Color.white)
                                            .frame(width: 60, height: 25)
                                            .background(.blue)
                                            .bold()
                                            .cornerRadius(8)
                                    }
                                    
                                    // Move the section Down
                                    Button {
                                        viewModel.moveSectionDown(sectionIndex: index, groupNumber: 2)
                                    } label: {
                                        Text("Down")
                                            .font(.callout)
                                            .foregroundColor(Color.white)
                                            .frame(width: 60, height: 25)
                                            .background(.blue)
                                            .bold()
                                            .cornerRadius(8)
                                    }
                                }
                            }
                        }
                        .id(UUID())
                        .padding(.horizontal, 20)
                    }
                    
                    Divider()
                        .frame(height: 1)
                        .overlay(Color.gray)
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                    
                    ScrollView {
                    
                    Text("List of the Array of Sections")
                        .font(.headline)
                    Text("G1 -> Group // (#) Order added to Array (every other one)")
                        .font(.footnote)
                    
                    LazyVGrid(columns: [GridItem(), GridItem()]) {
                        ForEach(firstColumn) { section in
                            HStack {
                                Spacer()
                                Text(section.title)
                                    .foregroundStyle(section.group == "Group 1" ? Color.green : Color.orange)
                                    .font(.system(size: 18))
                                    .fontWeight(.bold)
                                Spacer()
                            }
                        }
                        
                        ForEach(secondColumn) { section in
                            HStack {
                                Spacer()
                                Text(section.title)
                                    .foregroundStyle(section.group == "Group 1" ? Color.green : Color.orange)
                                    .font(.system(size: 18))
                                    .fontWeight(.bold)
                                
                                Spacer()
                            }
                        }
                        
                    }
                    .padding(.horizontal, 30)
                    .padding(.top, 5)
                        
                        Text("Above is the list of the sections that were created and added to the 'Sections' Array when the program started, alterating every other item to show that the items in the array could be placed at random and it would still work correctly. (These will also be updated when the sections above change)")
                            .multilineTextAlignment(.center)

                            
                        
                        Divider()
                            .frame(height: 1)
                            .overlay(Color.gray)
                            .padding(.horizontal, 20)
                            .padding(.top, 5)
                    
                        HStack {
                            Text("More about this program?")
                                .font(.headline)
                            Spacer()
                                
                        }
                        .padding(.top, 5)
                        .padding(.bottom, 1)
                            
                        
                        Text("This program contains a single array that contains a list of sections. Each section has a classifications assigned to it, either 'Group 1' or 'Group 2'. What this program does is 'filter' them and allow you to move the items in the list up and down without changing the entire array and messing up the order of all the items inside. Basically, 1 array with 2 groups based off it that can be moved around by swapping the indexes of the items. As you can see above, there are two groups, 'Group 1' and 'Group 2', each element inside of these groups can be moved up or down inside the array. While both groups are inside of the main 'Sections' array, they can be moved by finding the closest item that is assigned to that group and then swapping the indexes inside of it. This allows for movement throughout the seperated groups without ruining the entire array containing all of the sections.")
                            .multilineTextAlignment(.leading)

                            
                    }
                    .font(.subheadline)
                    .padding(.horizontal, 20)
                    .padding(.top, 10)

                }
                .navigationBarTitle("Single Array Multiple Groups Problem", displayMode: .inline)
                
            }
        }
        

    }
}

#Preview {
    ContentView()
}
