; ModuleID = 'hw2perf_unoptimized.ll'
source_filename = "hw2perf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [1000 x i64], align 16
  %2 = alloca [1000 x i64], align 16
  %3 = alloca [1000 x i64], align 16
  %4 = alloca [1000 x i64], align 16
  br label %5

5:                                                ; preds = %7, %0
  %.01 = phi i32 [ 0, %0 ], [ %17, %7 ]
  %6 = icmp ult i32 %.01, 1000
  br i1 %6, label %7, label %18

7:                                                ; preds = %5
  %8 = zext i32 %.01 to i64
  %9 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %8
  store i64 %8, ptr %9, align 8
  %10 = shl nuw nsw i32 %.01, 1
  %11 = zext i32 %10 to i64
  %12 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %8
  store i64 %11, ptr %12, align 8
  %13 = mul nsw i32 %.01, 3
  %14 = zext i32 %13 to i64
  %15 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %8
  store i64 %14, ptr %15, align 8
  %16 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %8
  store i64 0, ptr %16, align 8
  %17 = add nuw nsw i32 %.01, 1
  br label %5, !llvm.loop !6

18:                                               ; preds = %5
  tail call void @srand(i32 noundef 4) #3
  br label %19

19:                                               ; preds = %94, %18
  %.07 = phi i32 [ 15, %18 ], [ %.29, %94 ]
  %.04 = phi i32 [ 5, %18 ], [ %.26, %94 ]
  %.12 = phi i32 [ 0, %18 ], [ %95, %94 ]
  %.0 = phi i32 [ 0, %18 ], [ %.3, %94 ]
  %20 = icmp ult i32 %.12, 1000000000
  br i1 %20, label %21, label %96

21:                                               ; preds = %19
  %22 = sext i32 %.04 to i64
  %23 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %22
  %24 = load i64, ptr %23, align 8
  %25 = mul i64 %24, 87
  %26 = sdiv i64 %25, 4
  %27 = add nsw i64 %26, 23
  %28 = sext i32 %.07 to i64
  %29 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %28
  %30 = load i64, ptr %29, align 8
  %31 = mul i64 %30, 231
  %32 = sdiv i64 %31, 3
  %33 = add nsw i64 %32, 59
  %34 = add nsw i64 %27, %33
  %35 = srem i64 %34, 1000
  %36 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %35
  %37 = load i64, ptr %36, align 8
  %38 = add nsw i64 %37, %24
  %39 = add nsw i64 %38, %30
  %40 = mul nsw i64 %27, 11
  %41 = mul nsw i64 %33, 13
  %42 = add nsw i64 %40, %41
  %43 = mul nsw i64 %39, 17
  %44 = add nsw i64 %42, %43
  %45 = zext i32 %.12 to i64
  %46 = add nsw i64 %44, %45
  %47 = urem i32 %.12, 1000
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %48
  store i64 %46, ptr %49, align 8
  %50 = icmp ult i32 %.12, 100
  br i1 %50, label %51, label %94

51:                                               ; preds = %21
  br label %52

52:                                               ; preds = %87, %51
  %.010 = phi i32 [ 0, %51 ], [ %88, %87 ]
  %.1 = phi i32 [ %.0, %51 ], [ %.2, %87 ]
  %53 = icmp ult i32 %.010, 1000000
  br i1 %53, label %54, label %89

54:                                               ; preds = %52
  %55 = sext i32 %.1 to i64
  %56 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %55
  %57 = load i64, ptr %56, align 8
  %58 = mul nsw i64 %57, 6
  %59 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %55
  %60 = load i64, ptr %59, align 8
  %61 = sdiv i64 %60, 2
  %62 = add nsw i64 %58, %61
  %63 = srem i64 %62, 1000
  %64 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %63
  %65 = load i64, ptr %64, align 8
  %66 = shl nsw i64 %65, 1
  %67 = shl nsw i64 %57, 2
  %68 = add nsw i64 %66, %67
  %69 = srem i64 %68, 1000
  %70 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %69
  %71 = load i64, ptr %70, align 16
  %72 = mul nsw i64 %71, 6
  %73 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %55
  %74 = load i64, ptr %73, align 8
  %75 = mul nsw i64 %74, 3
  %76 = add nsw i64 %72, %75
  %77 = add nsw i64 %62, %68
  %78 = shl nsw i64 %76, 1
  %79 = add nsw i64 %77, %78
  %80 = zext i32 %.010 to i64
  %81 = add nsw i64 %79, %80
  %82 = urem i32 %.010, 100
  %83 = zext i32 %82 to i64
  %84 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %83
  store i64 %81, ptr %84, align 8
  %85 = icmp ult i32 %.010, 10
  br i1 %85, label %86, label %87

86:                                               ; preds = %54
  br label %87

87:                                               ; preds = %54, %86
  %.2 = phi i32 [ 59, %86 ], [ %.1, %54 ]
  %88 = add nuw nsw i32 %.010, 1
  br label %52, !llvm.loop !8

89:                                               ; preds = %52
  %90 = icmp eq i32 %.12, 0
  br i1 %90, label %91, label %94

91:                                               ; preds = %89
  %92 = tail call i32 @rand() #3
  %93 = srem i32 %92, 1000
  br label %94

94:                                               ; preds = %21, %89, %91
  %.29 = phi i32 [ %.07, %21 ], [ %.07, %91 ], [ 37, %89 ]
  %.26 = phi i32 [ %.04, %21 ], [ %93, %91 ], [ %.04, %89 ]
  %.3 = phi i32 [ %.0, %21 ], [ %.1, %89 ], [ %.1, %91 ]
  %95 = add nuw nsw i32 %.12, 1
  br label %19, !llvm.loop !9

96:                                               ; preds = %19
  br label %97

97:                                               ; preds = %99, %96
  %.23 = phi i32 [ 0, %96 ], [ %104, %99 ]
  %98 = icmp ult i32 %.23, 1000
  br i1 %98, label %99, label %105

99:                                               ; preds = %97
  %100 = zext i32 %.23 to i64
  %101 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %100
  %102 = load i64, ptr %101, align 8
  %103 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i64 noundef %102) #3
  %104 = add nuw nsw i32 %.23, 1
  br label %97, !llvm.loop !10

105:                                              ; preds = %97
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i32 @rand() #1

declare i32 @printf(ptr noundef, ...) #2

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
