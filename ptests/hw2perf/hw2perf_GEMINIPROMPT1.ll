; ModuleID = 'hw2perf_unoptimized.ll'
source_filename = "hw2perf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
  %1 = alloca [1000 x i64], align 16
  %2 = alloca [1000 x i64], align 16
  %3 = alloca [1000 x i64], align 16
  %4 = alloca [1000 x i64], align 16
  br label %5

5:                                                ; preds = %7, %0
  %storemerge = phi i32 [ 0, %0 ], [ %21, %7 ]
  %6 = icmp slt i32 %storemerge, 1000
  br i1 %6, label %7, label %22

7:                                                ; preds = %5
  %8 = sext i32 %storemerge to i64
  %9 = sext i32 %storemerge to i64
  %10 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %9
  store i64 %8, ptr %10, align 8
  %11 = shl nsw i32 %storemerge, 1
  %12 = sext i32 %11 to i64
  %13 = sext i32 %storemerge to i64
  %14 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %13
  store i64 %12, ptr %14, align 8
  %15 = mul nsw i32 %storemerge, 3
  %16 = sext i32 %15 to i64
  %17 = sext i32 %storemerge to i64
  %18 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %17
  store i64 %16, ptr %18, align 8
  %19 = sext i32 %storemerge to i64
  %20 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %19
  store i64 0, ptr %20, align 8
  %21 = add nsw i32 %storemerge, 1
  br label %5, !llvm.loop !6

22:                                               ; preds = %5
  tail call void @srand(i32 noundef 4) #3
  br label %23

23:                                               ; preds = %109, %22
  %.07 = phi i32 [ 0, %22 ], [ %.3, %109 ]
  %.05 = phi i32 [ 15, %22 ], [ %.16, %109 ]
  %.0 = phi i32 [ 5, %22 ], [ %.1, %109 ]
  %storemerge1 = phi i32 [ 0, %22 ], [ %110, %109 ]
  %24 = icmp slt i32 %storemerge1, 1000000000
  br i1 %24, label %25, label %.preheader

.preheader:                                       ; preds = %23
  br label %111

25:                                               ; preds = %23
  %26 = sext i32 %.0 to i64
  %27 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %26
  %28 = load i64, ptr %27, align 8
  %29 = mul i64 %28, 87
  %30 = sdiv i64 %29, 4
  %31 = add nsw i64 %30, 23
  %32 = sext i32 %.05 to i64
  %33 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %32
  %34 = load i64, ptr %33, align 8
  %35 = mul i64 %34, 231
  %36 = sdiv i64 %35, 3
  %37 = add nsw i64 %36, 59
  %38 = add nsw i64 %37, %31
  %39 = srem i64 %38, 1000
  %40 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %39
  %41 = load i64, ptr %40, align 8
  %42 = sext i32 %.0 to i64
  %43 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %42
  %44 = load i64, ptr %43, align 8
  %45 = add nsw i64 %44, %41
  %46 = sext i32 %.05 to i64
  %47 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %46
  %48 = load i64, ptr %47, align 8
  %49 = add nsw i64 %45, %48
  %50 = mul nsw i64 %31, 11
  %51 = mul nsw i64 %37, 13
  %52 = mul nsw i64 %49, 17
  %53 = sext i32 %storemerge1 to i64
  %54 = add i64 %50, %53
  %55 = add i64 %54, %51
  %56 = add i64 %55, %52
  %57 = srem i32 %storemerge1, 1000
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %58
  store i64 %56, ptr %59, align 8
  %60 = icmp slt i32 %storemerge1, 100
  br i1 %60, label %.preheader4, label %._crit_edge

._crit_edge:                                      ; preds = %25
  br label %109

.preheader4:                                      ; preds = %25
  br label %61

61:                                               ; preds = %.preheader4, %101
  %.18 = phi i32 [ %.07, %.preheader4 ], [ %.2, %101 ]
  %storemerge3 = phi i32 [ %102, %101 ], [ 0, %.preheader4 ]
  %62 = icmp slt i32 %storemerge3, 1000000
  br i1 %62, label %63, label %103

63:                                               ; preds = %61
  %64 = sext i32 %.18 to i64
  %65 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %64
  %66 = load i64, ptr %65, align 8
  %67 = mul nsw i64 %66, 6
  %68 = sext i32 %.18 to i64
  %69 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %68
  %70 = load i64, ptr %69, align 8
  %71 = sdiv i64 %70, 2
  %72 = add nsw i64 %71, %67
  %73 = srem i64 %72, 1000
  %74 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %73
  %75 = load i64, ptr %74, align 8
  %76 = shl nsw i64 %75, 1
  %77 = sext i32 %.18 to i64
  %78 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %77
  %79 = load i64, ptr %78, align 8
  %80 = shl nsw i64 %79, 2
  %81 = add nsw i64 %80, %76
  %82 = srem i64 %81, 1000
  %83 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %82
  %84 = load i64, ptr %83, align 16
  %85 = mul nsw i64 %84, 6
  %86 = sext i32 %.18 to i64
  %87 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %86
  %88 = load i64, ptr %87, align 8
  %89 = mul nsw i64 %88, 3
  %90 = add nsw i64 %89, %85
  %91 = mul nsw i64 %90, 2
  %92 = sext i32 %storemerge3 to i64
  %93 = add i64 %72, %92
  %94 = add i64 %93, %81
  %95 = add i64 %94, %91
  %96 = srem i32 %storemerge3, 100
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %97
  store i64 %95, ptr %98, align 8
  %99 = icmp slt i32 %storemerge3, 10
  br i1 %99, label %100, label %._crit_edge9

._crit_edge9:                                     ; preds = %63
  br label %101

100:                                              ; preds = %63
  br label %101

101:                                              ; preds = %._crit_edge9, %100
  %.2 = phi i32 [ 59, %100 ], [ %.18, %._crit_edge9 ]
  %102 = add nsw i32 %storemerge3, 1
  br label %61, !llvm.loop !8

103:                                              ; preds = %61
  %.18.lcssa = phi i32 [ %.18, %61 ]
  %104 = icmp eq i32 %storemerge1, 0
  br i1 %104, label %105, label %108

105:                                              ; preds = %103
  %106 = tail call i32 @rand() #3
  %107 = srem i32 %106, 1000
  br label %109

108:                                              ; preds = %103
  br label %109

109:                                              ; preds = %._crit_edge, %108, %105
  %.3 = phi i32 [ %.18.lcssa, %105 ], [ %.18.lcssa, %108 ], [ %.07, %._crit_edge ]
  %.16 = phi i32 [ %.05, %105 ], [ 37, %108 ], [ %.05, %._crit_edge ]
  %.1 = phi i32 [ %107, %105 ], [ %.0, %108 ], [ %.0, %._crit_edge ]
  %110 = add nsw i32 %storemerge1, 1
  br label %23, !llvm.loop !9

111:                                              ; preds = %.preheader, %113
  %storemerge2 = phi i32 [ %118, %113 ], [ 0, %.preheader ]
  %112 = icmp slt i32 %storemerge2, 1000
  br i1 %112, label %113, label %119

113:                                              ; preds = %111
  %114 = sext i32 %storemerge2 to i64
  %115 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %114
  %116 = load i64, ptr %115, align 8
  %117 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i64 noundef %116) #3
  %118 = add nsw i32 %storemerge2, 1
  br label %111, !llvm.loop !10

119:                                              ; preds = %111
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
declare i32 @rand() local_unnamed_addr #1

declare i32 @printf(ptr noundef, ...) local_unnamed_addr #2

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
