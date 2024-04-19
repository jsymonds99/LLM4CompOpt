; ModuleID = 'hw2perf_unoptimized.ll'
source_filename = "hw2perf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
codeRepl2:
  %0 = alloca [1000 x i64], align 16
  %1 = alloca [1000 x i64], align 16
  %2 = alloca [1000 x i64], align 16
  %3 = alloca [1000 x i64], align 16
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  %14 = alloca i64, align 8
  store i32 0, ptr %4, align 4
  call void @main.extracted.2(ptr nonnull %4, ptr nonnull %0, ptr nonnull %1, ptr nonnull %2, ptr nonnull %3)
  call void @srand(i32 noundef 4) #3
  store i32 5, ptr %5, align 4
  store i32 15, ptr %6, align 4
  store i32 0, ptr %7, align 4
  store i32 0, ptr %8, align 4
  store i32 0, ptr %4, align 4
  call void @main.extracted.1(ptr nonnull %4, ptr nonnull %5, ptr nonnull %0, ptr nonnull %9, ptr nonnull %6, ptr nonnull %1, ptr nonnull %10, ptr nonnull %2, ptr nonnull %11, ptr nonnull %3, ptr nonnull %7, ptr nonnull %8, ptr nonnull %12, ptr nonnull %13, ptr nonnull %14)
  store i32 0, ptr %4, align 4
  call void @main.extracted(ptr nonnull %4, ptr nonnull %3)
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i32 @rand() #1

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind uwtable
define internal void @main.extracted(ptr %0, ptr %1) #0 {
newFuncRoot:
  %.pre = load i32, ptr %0, align 4
  br label %2

2:                                                ; preds = %newFuncRoot, %5
  %3 = phi i32 [ %.pre, %newFuncRoot ], [ %11, %5 ]
  %4 = icmp slt i32 %3, 1000
  br i1 %4, label %5, label %.exitStub

5:                                                ; preds = %2
  %6 = sext i32 %3 to i64
  %7 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %6
  %8 = load i64, ptr %7, align 8
  %9 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i64 noundef %8) #3
  %10 = load i32, ptr %0, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, ptr %0, align 4
  br label %2, !llvm.loop !6

.exitStub:                                        ; preds = %2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @main.extracted.1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, ptr %12, ptr %13, ptr %14) #0 {
newFuncRoot:
  %.pre = load i32, ptr %0, align 4
  br label %15

15:                                               ; preds = %newFuncRoot, %74
  %16 = phi i32 [ %.pre, %newFuncRoot ], [ %76, %74 ]
  %17 = icmp slt i32 %16, 1000000000
  br i1 %17, label %18, label %.exitStub

18:                                               ; preds = %15
  %19 = load i32, ptr %1, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %20
  %22 = load i64, ptr %21, align 8
  %23 = mul i64 %22, 87
  %24 = sdiv i64 %23, 4
  %25 = add nsw i64 %24, 23
  store i64 %25, ptr %3, align 8
  %26 = load i32, ptr %4, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [1000 x i64], ptr %5, i64 0, i64 %27
  %29 = load i64, ptr %28, align 8
  %30 = mul i64 %29, 231
  %31 = sdiv i64 %30, 3
  %32 = add nsw i64 %31, 59
  store i64 %32, ptr %6, align 8
  %33 = load i64, ptr %3, align 8
  %34 = add nsw i64 %32, %33
  %35 = srem i64 %34, 1000
  %36 = getelementptr inbounds [1000 x i64], ptr %7, i64 0, i64 %35
  %37 = load i64, ptr %36, align 8
  %38 = load i32, ptr %1, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %39
  %41 = load i64, ptr %40, align 8
  %42 = add nsw i64 %41, %37
  %43 = load i32, ptr %4, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [1000 x i64], ptr %5, i64 0, i64 %44
  %46 = load i64, ptr %45, align 8
  %47 = add nsw i64 %42, %46
  store i64 %47, ptr %8, align 8
  %48 = load i64, ptr %3, align 8
  %49 = mul nsw i64 %48, 11
  %50 = load i64, ptr %6, align 8
  %51 = mul nsw i64 %50, 13
  %52 = mul nsw i64 %47, 17
  %53 = load i32, ptr %0, align 4
  %54 = sext i32 %53 to i64
  %55 = add i64 %49, %52
  %56 = add i64 %55, %51
  %57 = add nsw i64 %56, %54
  %58 = srem i32 %53, 1000
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [1000 x i64], ptr %9, i64 0, i64 %59
  store i64 %57, ptr %60, align 8
  %61 = load i32, ptr %0, align 4
  %62 = icmp slt i32 %61, 100
  br i1 %62, label %63, label %74

63:                                               ; preds = %18
  br label %64

64:                                               ; preds = %121, %63
  %storemerge = phi i32 [ 0, %63 ], [ %123, %121 ]
  store i32 %storemerge, ptr %10, align 4
  %65 = icmp slt i32 %storemerge, 1000000
  br i1 %65, label %77, label %66

66:                                               ; preds = %64
  %67 = load i32, ptr %0, align 4
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %70, label %69

69:                                               ; preds = %66
  store i32 37, ptr %4, align 4
  br label %73

70:                                               ; preds = %66
  %71 = tail call i32 @rand() #3
  %72 = srem i32 %71, 1000
  store i32 %72, ptr %1, align 4
  br label %73

73:                                               ; preds = %69, %70
  %.pre1 = load i32, ptr %0, align 4
  br label %74

74:                                               ; preds = %73, %18
  %75 = phi i32 [ %.pre1, %73 ], [ %61, %18 ]
  %76 = add nsw i32 %75, 1
  store i32 %76, ptr %0, align 4
  br label %15, !llvm.loop !8

77:                                               ; preds = %64
  %78 = load i32, ptr %11, align 4
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds [1000 x i64], ptr %5, i64 0, i64 %79
  %81 = load i64, ptr %80, align 8
  %82 = mul nsw i64 %81, 6
  %83 = getelementptr inbounds [1000 x i64], ptr %7, i64 0, i64 %79
  %84 = load i64, ptr %83, align 8
  %85 = sdiv i64 %84, 2
  %86 = add nsw i64 %85, %82
  store i64 %86, ptr %12, align 8
  %87 = srem i64 %86, 1000
  %88 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %87
  %89 = load i64, ptr %88, align 8
  %90 = shl nsw i64 %89, 1
  %91 = load i32, ptr %11, align 4
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds [1000 x i64], ptr %5, i64 0, i64 %92
  %94 = load i64, ptr %93, align 8
  %95 = shl nsw i64 %94, 2
  %96 = add nsw i64 %95, %90
  store i64 %96, ptr %13, align 8
  %97 = srem i64 %96, 1000
  %98 = getelementptr inbounds [1000 x i64], ptr %7, i64 0, i64 %97
  %99 = load i64, ptr %98, align 8
  %100 = mul nsw i64 %99, 6
  %101 = load i32, ptr %11, align 4
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %102
  %104 = load i64, ptr %103, align 8
  %105 = mul nsw i64 %104, 3
  %106 = add nsw i64 %105, %100
  store i64 %106, ptr %14, align 8
  %107 = load i64, ptr %12, align 8
  %108 = load i64, ptr %13, align 8
  %109 = add nsw i64 %108, %107
  %110 = mul nsw i64 %106, 2
  %111 = add nsw i64 %109, %110
  %112 = load i32, ptr %10, align 4
  %113 = sext i32 %112 to i64
  %114 = add nsw i64 %111, %113
  %115 = srem i32 %112, 100
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds [1000 x i64], ptr %9, i64 0, i64 %116
  store i64 %114, ptr %117, align 8
  %118 = load i32, ptr %10, align 4
  %119 = icmp slt i32 %118, 10
  br i1 %119, label %120, label %121

120:                                              ; preds = %77
  store i32 59, ptr %11, align 4
  %.pre2 = load i32, ptr %10, align 4
  br label %121

121:                                              ; preds = %120, %77
  %122 = phi i32 [ %.pre2, %120 ], [ %118, %77 ]
  %123 = add nsw i32 %122, 1
  br label %64, !llvm.loop !9

.exitStub:                                        ; preds = %15
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @main.extracted.2(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4) #0 {
newFuncRoot:
  %.pre = load i32, ptr %0, align 4
  br label %5

5:                                                ; preds = %newFuncRoot, %8
  %6 = phi i32 [ %.pre, %newFuncRoot ], [ %25, %8 ]
  %7 = icmp slt i32 %6, 1000
  br i1 %7, label %8, label %.exitStub

8:                                                ; preds = %5
  %9 = sext i32 %6 to i64
  %10 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %9
  store i64 %9, ptr %10, align 8
  %11 = load i32, ptr %0, align 4
  %12 = shl nsw i32 %11, 1
  %13 = sext i32 %12 to i64
  %14 = sext i32 %11 to i64
  %15 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %14
  store i64 %13, ptr %15, align 8
  %16 = load i32, ptr %0, align 4
  %17 = mul nsw i32 %16, 3
  %18 = sext i32 %17 to i64
  %19 = sext i32 %16 to i64
  %20 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %19
  store i64 %18, ptr %20, align 8
  %21 = load i32, ptr %0, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %22
  store i64 0, ptr %23, align 8
  %24 = load i32, ptr %0, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %0, align 4
  br label %5, !llvm.loop !10

.exitStub:                                        ; preds = %5
  ret void
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.6"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
