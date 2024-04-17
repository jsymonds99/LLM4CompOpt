//===-- Frequent Path Loop Invariant Code Motion Pass --------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===---------------------------------------------------------------------===//
//
// EECS583 W24 - This pass can be used as a template for your FPLICM homework
//               assignment.
//               The passes get registered as "fplicm-correctness" and
//               "fplicm-performance".
//
//
////===-------------------------------------------------------------------===//
#include "llvm/Analysis/BlockFrequencyInfo.h"
#include "llvm/Analysis/BranchProbabilityInfo.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/LoopIterator.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/IR/CFG.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/PassManager.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Transforms/Scalar/LoopPassManager.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/Transforms/Utils/LoopUtils.h"

/* *******Implementation Starts Here******* */
// You can include more Header files here
#include <iostream>
#include <vector>
#include <map>
#include <string>
#include<iostream>
#include <sstream>
#include <tuple>
/* *******Implementation Ends Here******* */

using namespace llvm;

struct loopTree {
  Loop* loop;
  std::vector<loopTree> children;
};

void getLoopInfo(Loop *L, std::map<llvm::BasicBlock*, std::string> &blockNames, BranchProbabilityAnalysis::Result &bpi) {
  if (L == nullptr) {
    return;
  }
  errs() << "\tLoop: " << blockNames[L->getHeader()] << "\n";
  errs() << "\t\t Preheader: " << blockNames[L->getLoopPreheader()] << "\n";
  errs() << "\t\t Exiting Edge: " << blockNames[L->getLoopLatch()] << "\n";
  errs() << "\t\t Depth: " << L->getLoopDepth() << "\n";
  if (L->getLoopDepth() > 1) {
    errs() << "\t\t\t Parent Loop: " << blockNames[L->getParentLoop()->getHeader()] << "\n";
  }
  errs() << "\t\t Size: " << L->getNumBlocks() << "\n";
  for (auto &BB : L->getBlocks()) {
    errs() << "\t\t\t Block: " << blockNames[BB] << "\n";
    for (auto &I : *BB) {
      if (I.getOpcode() == llvm::Instruction::Br) {
        if (I.getNumOperands() == 3) {
          errs() << "\t\t\t\t Conditional Branch to ";
          for (uint i = 0; i < I.getNumSuccessors(); i++) {
            llvm::BranchProbability branchData = bpi.getEdgeProbability(BB, i);
            double branchProb = (double)branchData.getNumerator() / branchData.getDenominator();
            errs() << blockNames[I.getSuccessor(i)] << "(p=" << format("%.4f", branchProb) << ")" << (i == I.getNumSuccessors() - 1 ? "" : " or ");
          }
          errs() << "\n";
           
        }
        else {
          errs() << "\t\t\t\t Unconditional Branch to " << blockNames[I.getSuccessor(0)] << "\n";
        }
      }
    }

  }
}

void printLoops(Loop *L, std::map<llvm::BasicBlock*, std::string> &blockNames) {
  errs() << "\t\tLoop: " << blockNames[L->getHeader()] << "\n";
  for (Loop *SubLoop : L->getSubLoops()) {
    printLoops(SubLoop, blockNames);
  }
}

void populateLoops(loopTree &tree, std::map<llvm::BasicBlock*, std::string> blockNames, BranchProbabilityAnalysis::Result &bpi){
  getLoopInfo(tree.loop, blockNames, bpi);
  if (tree.loop == nullptr && tree.children.size() > 0){
    for (auto &child : tree.children) {
      populateLoops(child, blockNames, bpi);
    }
  }
  for (auto &L : tree.loop->getSubLoops()) {
    loopTree child = {L, {}};
    tree.children.push_back(child);
    populateLoops(child, blockNames, bpi);
  }
}

static std::string getBBName(const BasicBlock *Node,
                                      const Function *) {

    // if node is first block of function, return function name
    if (Node == &Node->getParent()->front())
        return Node->getParent()->getName().str();

    if (!Node->getName().empty())
        return Node->getName().str();
    std::string Str;
    raw_string_ostream OS(Str);
    Node->printAsOperand(OS, false);
    return OS.str();
}

void printIR(const Function &F) {
  errs() << "Function: " << F.getName() << "\n";
  if (F.args().begin() != F.args().end()){ // if there are input args
    errs() << "\tInputs:\n";
    for (const Argument &A : F.args()) {
      errs() << "\t\t" << A << "\n";
    }
  }

  // for (const BasicBlock &BB : F) {
  //   errs() << "\t" << getBBName(&BB, &F) << "\n";
  //   for (const Instruction &I : BB) {
  //     errs() << "\t" << I << "\n";
  //   }
  // }
  // errs() << "\n";
}

namespace {
  struct HW2CorrectnessPass : public PassInfoMixin<HW2CorrectnessPass> {

    PreservedAnalyses run(Function &F, FunctionAnalysisManager &FAM) {
      llvm::BlockFrequencyAnalysis::Result &bfi = FAM.getResult<BlockFrequencyAnalysis>(F);
      llvm::BranchProbabilityAnalysis::Result &bpi = FAM.getResult<BranchProbabilityAnalysis>(F);
      llvm::LoopAnalysis::Result &li = FAM.getResult<LoopAnalysis>(F);

      printIR(F);

      std::map<llvm::BasicBlock*, std::string> blockNames;
      for (llvm::BasicBlock &BB : F) {
        blockNames[&BB] = getBBName(&BB, &F);
      }

      loopTree root = {nullptr, {}};      
      for (auto &L : li) {
        root.children.push_back({L, {}});
        populateLoops(root.children.back(), blockNames, bpi);
      }
      errs() << "\n\n";

      return PreservedAnalyses::all();
    }
  };
  struct HW2PerformancePass : public PassInfoMixin<HW2PerformancePass> {
    PreservedAnalyses run(Function &F, FunctionAnalysisManager &FAM) {
      llvm::BlockFrequencyAnalysis::Result &bfi = FAM.getResult<BlockFrequencyAnalysis>(F);
      llvm::BranchProbabilityAnalysis::Result &bpi = FAM.getResult<BranchProbabilityAnalysis>(F);
      llvm::LoopAnalysis::Result &li = FAM.getResult<LoopAnalysis>(F);
      return PreservedAnalyses::all();
    }
  };
}

extern "C" ::llvm::PassPluginLibraryInfo LLVM_ATTRIBUTE_WEAK llvmGetPassPluginInfo() {
  return {
    LLVM_PLUGIN_API_VERSION, "HW2Pass", "v0.1",
    [](PassBuilder &PB) {
      PB.registerPipelineParsingCallback(
        [](StringRef Name, FunctionPassManager &FPM,
        ArrayRef<PassBuilder::PipelineElement>) {
          if(Name == "fplicm-correctness"){
            FPM.addPass(HW2CorrectnessPass());
            return true;
          }
          if(Name == "fplicm-performance"){
            FPM.addPass(HW2PerformancePass());
            return true;
          }
          return false;
        }
      );
    }
  };
}