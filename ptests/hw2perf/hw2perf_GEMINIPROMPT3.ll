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

5:                                                ; preds = %6, %0
  %lsr.iv26 = phi i64 [ %lsr.iv.next27, %6 ], [ 0, %0 ]
  %lsr.iv = phi i64 [ %lsr.iv.next, %6 ], [ 0, %0 ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %6 ], [ 0, %0 ]
  %exitcond = icmp ne i64 %indvars.iv, 1000
  br i1 %exitcond, label %6, label %8

6:                                                ; preds = %5
  %7 = shl nuw nsw i64 %indvars.iv, 3
  %scevgep25 = getelementptr i8, ptr %1, i64 %7
  store i64 %indvars.iv, ptr %scevgep25, align 8
  %scevgep23 = getelementptr i8, ptr %2, i64 %7
  store i64 %lsr.iv26, ptr %scevgep23, align 8
  %scevgep24 = getelementptr i8, ptr %3, i64 %7
  store i64 %lsr.iv, ptr %scevgep24, align 8
  %scevgep = getelementptr i8, ptr %4, i64 %7
  store i64 0, ptr %scevgep, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %lsr.iv.next = add nuw nsw i64 %lsr.iv, 3
  %lsr.iv.next27 = add nuw nsw i64 %lsr.iv26, 2
  br label %5, !llvm.loop !6

8:                                                ; preds = %5
  call void @srand(i32 noundef 4) #3
  br label %9

9:                                                ; preds = %81, %8
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %81 ], [ 0, %8 ]
  %.06 = phi i32 [ 0, %8 ], [ %.3, %81 ]
  %.04 = phi i32 [ 15, %8 ], [ %.15, %81 ]
  %.0 = phi i32 [ 5, %8 ], [ %.1, %81 ]
  %exitcond18 = icmp ne i64 %indvars.iv15, 1000000000
  br i1 %exitcond18, label %10, label %.preheader

.preheader:                                       ; preds = %9
  br label %82

10:                                               ; preds = %9
  %11 = sext i32 %.0 to i64
  %12 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %11
  %13 = load i64, ptr %12, align 8
  %14 = mul i64 %13, 87
  %15 = sdiv i64 %14, 4
  %16 = add nsw i64 %15, 23
  %17 = zext i32 %.04 to i64
  %18 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %17
  %19 = load i64, ptr %18, align 8
  %20 = mul i64 %19, 231
  %21 = sdiv i64 %20, 3
  %22 = add nsw i64 %21, 59
  %23 = add nsw i64 %22, %16
  %24 = srem i64 %23, 1000
  %25 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %24
  %26 = load i64, ptr %25, align 8
  %27 = add nsw i64 %13, %26
  %28 = add nsw i64 %27, %19
  %29 = mul nsw i64 %16, 11
  %30 = mul nsw i64 %22, 13
  %31 = mul nsw i64 %28, 17
  %32 = add i64 %31, %29
  %33 = add i64 %32, %30
  %34 = add nsw i64 %33, %indvars.iv15
  %35 = trunc i64 %indvars.iv15 to i32
  %.urem14 = urem i32 %35, 1000
  %36 = zext i32 %.urem14 to i64
  %37 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %36
  store i64 %34, ptr %37, align 8
  %38 = icmp ult i64 %indvars.iv15, 100
  br i1 %38, label %.preheader8, label %81

.preheader8:                                      ; preds = %10
  br label %39

39:                                               ; preds = %.preheader8, %75
  %indvars.iv10 = phi i64 [ 0, %.preheader8 ], [ %indvars.iv.next11, %75 ]
  %.17 = phi i32 [ %.2, %75 ], [ %.06, %.preheader8 ]
  %lsr30 = trunc i64 %indvars.iv10 to i32
  %40 = udiv i32 %lsr30, 100
  %41 = mul nsw i32 %40, -100
  %42 = zext i32 %41 to i64
  %exitcond13 = icmp ne i64 %indvars.iv10, 1000000
  br i1 %exitcond13, label %43, label %76

43:                                               ; preds = %39
  %44 = zext i32 %.17 to i64
  %45 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %44
  %46 = load i64, ptr %45, align 8
  %47 = mul nsw i64 %46, 6
  %48 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %44
  %49 = load i64, ptr %48, align 8
  %50 = sdiv i64 %49, 2
  %51 = add nsw i64 %50, %47
  %52 = srem i64 %51, 1000
  %53 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %52
  %54 = load i64, ptr %53, align 8
  %55 = shl nsw i64 %54, 1
  %56 = shl nsw i64 %46, 2
  %57 = add nsw i64 %56, %55
  %58 = srem i64 %57, 1000
  %59 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %58
  %60 = load i64, ptr %59, align 16
  %61 = mul nsw i64 %60, 6
  %62 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %44
  %63 = load i64, ptr %62, align 8
  %64 = mul nsw i64 %63, 3
  %65 = add nsw i64 %64, %61
  %66 = add nsw i64 %57, %51
  %67 = mul nsw i64 %65, 2
  %68 = add i64 %66, %67
  %69 = add i64 %indvars.iv10, %68
  %70 = add i64 %indvars.iv10, %42
  %tmp = trunc i64 %70 to i32
  %71 = sext i32 %tmp to i64
  %72 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %71
  store i64 %69, ptr %72, align 8
  %73 = icmp ult i64 %indvars.iv10, 10
  br i1 %73, label %74, label %75

74:                                               ; preds = %43
  br label %75

75:                                               ; preds = %43, %74
  %.2 = phi i32 [ 59, %74 ], [ %.17, %43 ]
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  br label %39, !llvm.loop !8

76:                                               ; preds = %39
  %77 = icmp eq i64 %indvars.iv15, 0
  br i1 %77, label %78, label %81

78:                                               ; preds = %76
  %79 = call i32 @rand() #3
  %80 = srem i32 %79, 1000
  br label %81

81:                                               ; preds = %76, %10, %78
  %.3 = phi i32 [ %.17, %78 ], [ %.06, %10 ], [ %.17, %76 ]
  %.15 = phi i32 [ %.04, %78 ], [ %.04, %10 ], [ 37, %76 ]
  %.1 = phi i32 [ %80, %78 ], [ %.0, %10 ], [ %.0, %76 ]
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  br label %9, !llvm.loop !9

82:                                               ; preds = %.preheader, %83
  %indvars.iv19 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next20, %83 ]
  %exitcond22 = icmp ne i64 %indvars.iv19, 1000
  br i1 %exitcond22, label %83, label %87

83:                                               ; preds = %82
  %84 = shl nuw nsw i64 %indvars.iv19, 3
  %scevgep31 = getelementptr i8, ptr %4, i64 %84
  %85 = load i64, ptr %scevgep31, align 8
  %86 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i64 noundef %85) #3
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  br label %82, !llvm.loop !10

87:                                               ; preds = %82
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
