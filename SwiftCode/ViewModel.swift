//
//  ViewModel.swift
//  DoubleGroupArraySwapProgram
//
//  Created by Hyrum Paramore on 12/21/23.
//
// This is a ViewModel that contains and manages all of the data for this Array Problem. It also contains functions that will help to move the data around in a way that solves the problem. Dummy sections are created when the program starts to help demo the program. This file also contains a struct that allows the creation of Sections and gives them basic properties to work with, like an id, title, and group.

import Foundation
import SwiftUI
 

// Creates a section to build/test with.
struct Section : Identifiable {
    
    var id = UUID() // Gives it a unique ID to help manage.
    var title : String // Title to be able to print out what it is.
    var group : String // Group to help place it in groups to sort/filter.
    
}


// Class/ViewModel that stores all of the data for this problem. It also stores all of the functions to make a solution and make it work.
class ViewModel : ObservableObject {
    
    // Creates an array to store the sections.
    @Published var sections : [Section] = []

    // Initializes/creates the sections and adds them to an array.
    init() {
        createDummySections()
    }
    

    // Creates the dummy sections to help demo the program.
    func createDummySections() {
        sections.append(Section.init(title: "G1 - (0)", group: "Group 1"))
        sections.append(Section.init(title: "G2 - (1)", group: "Group 2"))
        sections.append(Section.init(title: "G1 - (2)", group: "Group 1"))
        sections.append(Section.init(title: "G2 - (3)", group: "Group 2"))
        sections.append(Section.init(title: "G1 - (5)", group: "Group 1"))
        sections.append(Section.init(title: "G2 - (4)", group: "Group 2"))
        sections.append(Section.init(title: "G1 - (6)", group: "Group 1"))
        sections.append(Section.init(title: "G2 - (7)", group: "Group 2"))
        sections.append(Section.init(title: "G1 - (8)", group: "Group 1"))
        sections.append(Section.init(title: "G2 - (9)", group: "Group 2"))
    }
    
    // Function that moves a section UP based on the index and the Group.
    func moveSectionUp(sectionIndex: Int, groupNumber: Int) {
        
        // Find the section that is above the current sectionIndex.
        var secondSectionIndex = -1

        // Iterate through the sections in reverse order, starting from the section just before the current sectionIndex.
        for index in (0..<sectionIndex).reversed() {
            // Check if the current section's group matches the specified groupNumber.
            // If groupNumber is 1, compare the section's group to "Group 1"; otherwise, compare it to "Group 2".
            if sections[index].group == (groupNumber == 1 ? "Group 1" : "Group 2") {
                // Store the index of the previous section belonging to the specified group.
                secondSectionIndex = index
                // Exit the loop as the desired section is found.
                break
            }
            // Continue iterating through sections until finding a match or reaching the beginning.
        }

        if secondSectionIndex != -1 {
            // Swap the sections at sectionIndex and secondSectionIndex.
            sections.swapAt(sectionIndex, secondSectionIndex)
            // Now the sections have been swapped.
            print("Sections have been swapped.")
        } else {
            // Prints error if it didn't swap, or if it is on the top of the array.
            print("Couldn't find the section to swap with.")
        }

    }
    
    // Function that moves a section DOWN based on the index and the Group.
    func moveSectionDown(sectionIndex: Int, groupNumber: Int) {

        // Find the section that is below the current sectionIndex.
        var secondSectionIndex = -1

        // Loop through the sections starting from the index after the current sectionIndex.
        for index in (sectionIndex + 1)..<sections.count {
            // Check if the current section's group matches the specified groupNumber.
            // If groupNumber is 1, compare the section's group to "Group 1"; otherwise, compare it to "Group 2".
            if sections[index].group == (groupNumber == 1 ? "Group 1" : "Group 2") {
                // Store the index of the next section belonging to the specified group.
                secondSectionIndex = index
                // Exit the loop as the desired section is found.
                break
            }
            // Continue iterating through sections until finding a match or reaching the end.
        }

        // Run a check.
        if secondSectionIndex != -1 {
            // Swap the sections at sectionIndex and secondSectionIndex.
            sections.swapAt(sectionIndex, secondSectionIndex)
            // Now the sections have been swapped.
            print("Sections have been swapped.")
        } else {
            // Prints error if it didn't swap, or if it is on the bottom of the array.
            print("Couldn't find the section to swap with.")
        }
    }
    
}

